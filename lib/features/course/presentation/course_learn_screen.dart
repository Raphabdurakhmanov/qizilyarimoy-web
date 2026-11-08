import 'package:app/config/app_colors.dart';
import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/snacbars/custom_snacbar.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_loading.dart';
import 'package:app/config/widgets/html_view_widget.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/course/presentation/bloc/lesson/lesson_bloc.dart';
import 'package:app/features/course/presentation/bloc/task/task_bloc.dart';
import 'package:app/features/course/presentation/modules_screen.dart';
import 'package:app/features/course/presentation/widgets/youtube_player.dart';
import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:app/config/services/download_service.dart';
import 'package:app/features/course/domain/entities/task_entity.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CourseLearnScreen extends StatefulWidget {
  const CourseLearnScreen({
    super.key,
    required this.lesson,
    required this.courseId,
  });
  final LessonEntity lesson;
  final int courseId;
  @override
  State<CourseLearnScreen> createState() => _CourseLearnScreenState();
}

class _CourseLearnScreenState extends State<CourseLearnScreen> {
  LessonEntity get lesson => widget.lesson;
  int get courseId => widget.courseId;

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  YoutubePlayerController? _ytController;
  bool isPreviousButton = false;

  @override
  void initState() {
    super.initState();

    final url = lesson.videoUrl;
    print("Video URL: $url");
    if (_isYouTubeUrl(url)) {
      _initializeYouTube(url!);
    } else if (lesson.videoStream != null) {
      initializePlayer(lesson.videoStream!);
    } else if (url != null) {
      initializePlayer(url);
    }
    context.read<TaskBloc>().add(TaskEvent.fetchTasks(lessonId: lesson.id!));
  }

  bool _isYouTubeUrl(String? url) {
    if (url == null) return false;
    return YoutubePlayerController.convertUrlToId(url) != null;
  }

  void _initializeYouTube(String url) {
    final id = YoutubePlayerController.convertUrlToId(url)!;
    _ytController = YoutubePlayerController.fromVideoId(
      videoId: id,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        enableCaption: true,
        mute: false,
      ),
    );
    setState(() {});
  }

  Future<void> initializePlayer(String link) async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(link));
    await _videoPlayerController!.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
      looping: false,
      aspectRatio: 16 / 9,
      allowFullScreen: true,
      placeholder: const Center(child: CircularProgressIndicator()),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            'Error: $errorMessage',
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _ytController?.close();
    super.dispose();
  }

  Widget playerType() {
    // if (_ytController != null) {
    //   return _youtubePlayerWidget();
    // } else
    if (lesson.videoStream != null && lesson.videoUrl == null) {
      return _videoPlayerWidget();
    } else if (lesson.videoUrl != null && lesson.videoStream == null) {
      return _videoPlayerWidget();
    } else if (lesson.imageFile != null) {
      return ImageWidget(imageUrl: lesson.imageFile!);
    } else if (lesson.imageUrl != null) {
      return ImageWidget(imageUrl: lesson.imageUrl!);
    } else {
      return Center(
        child: Text('no_media_available'.tr(), style: AppTextStyles.bodyMedium),
      );
    }
  }

  Widget _youtubePlayerWidget() {
    return YoutubePlayer(controller: _ytController!, aspectRatio: 16 / 9);
  }

  Widget _videoPlayerWidget() {
    return Center(
      child:
          _chewieController != null &&
                  _videoPlayerController != null &&
                  _videoPlayerController!.value.isInitialized
              ? Chewie(controller: _chewieController!)
              : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading Video...'),
                ],
              ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lessonState = context.watch<LessonBloc>().state;
    final lessonLoading = lessonState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final showSkeleton = lessonLoading;

    return BlocListener<LessonBloc, LessonState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          loading: (value) {},
          loaded: (value) {
            context.read<CourseBloc>().add(
              CourseEvent.changeActiveLesson(value.lesson, courseId),
            );
            context.read<CourseDetailsBloc>().add(
              CourseDetailsEvent.completeLesson(lesson),
            );
            context.read<UserBloc>().add(UserEvent.getProfile());
            context.replace(
              AppRoutes.courseStartLearning,
              extra: {
                "lesson": value.lesson,
                "course": courseId,
                "key": GlobalKey(),
              },
            );
          },
          error: (value) {
            // Handle error state if needed
            if (value.failure is UnknownFailure) {
              context.pop();
              showCustomSnacbar(context, message: value.failure.message);
            } else {
              showCustomSnacbar(
                context,
                message: value.failure.message,
                type: SnacbarType.error,
              );
            }
          },
        );
      },
      child: CustomYoutubePlayer(
        controller: _ytController,
        builder: (context, player) {
          return Scaffold(
            appBar: _appBar(context),
            body:
                showSkeleton
                    ? _loadingSkeleton()
                    : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredBox(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppConstants.defaultPadding,
                                vertical: AppConstants.defaultPadding / 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: player ?? playerType(),
                                  ),
                                  const SizedBox(
                                    height: AppConstants.defaultPadding,
                                  ),

                                  Text(
                                    lesson.title ?? "",
                                    style: AppTextStyles.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: AppConstants.defaultPadding,
                                  ),
                                  TextWidget(
                                    lesson.description ?? "",
                                    style: AppTextStyles.caption.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: AppConstants.defaultPadding,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _tasksWidget(),
                        ],
                      ),
                    ),
            bottomNavigationBar: Container(
              height: 65,
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.defaultPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppConstants.defaultBorderRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: BlocBuilder<LessonBloc, LessonState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          isPreviousButton = true;
                          context.read<LessonBloc>().add(
                            LessonEvent.previousLesson(courseId, lesson.id!),
                          );
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child:
                                  (state.whenOrNull(loading: () => true) ==
                                              true &&
                                          isPreviousButton)
                                      ? CustomLoading(
                                        color: AppColors.primaryColor,
                                      )
                                      : SvgWidget(
                                        icon: Assets.assetsIconsLeftArrow,
                                      ),
                            ),
                            const SizedBox(width: AppConstants.defaultPadding),
                            Text(
                              "previous".tr(),
                              style: AppTextStyles.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          isPreviousButton = false;
                          context.read<LessonBloc>().add(
                            LessonEvent.nextLesson(courseId, lesson.id!),
                          );
                        },
                        child: Row(
                          children: [
                            Text("next".tr(), style: AppTextStyles.bodyMedium),
                            const SizedBox(width: AppConstants.defaultPadding),
                            CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              child:
                                  (state.whenOrNull(loading: () => true) ==
                                              true &&
                                          !isPreviousButton)
                                      ? CustomLoading()
                                      : SvgWidget(
                                        icon: Assets.assetsIconsRightArrow,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: CustomBackButton(),
      centerTitle: true,
      title: Text(widget.lesson.title ?? "", style: AppTextStyles.titleMedium),
      actions: [
        CustomRoundedButton(
          icon: Assets.assetsIconsModules,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ModulesScreen(activeLesson: lesson.id!);
                },
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  final tween = Tween(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeInOut));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _loadingSkeleton() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.defaultPadding / 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShimmer(
              height:
                  (MediaQuery.of(context).size.width -
                      (AppConstants.defaultPadding * 2)) *
                  9 /
                  16,
              width: double.infinity,
              borderRadius: 12,
              margin: const EdgeInsets.only(top: 4),
            ),
            const SizedBox(height: 20),
            const CustomShimmer(height: 22, width: 220),
            const SizedBox(height: 12),
            const CustomShimmer(height: 14, width: double.infinity),
            const CustomShimmer(
              height: 14,
              width: double.infinity,
              margin: EdgeInsets.only(top: 8),
            ),
            const CustomShimmer(
              height: 14,
              width: 180,
              margin: EdgeInsets.only(top: 8),
            ),
            const SizedBox(height: 28),
            const CustomShimmer(height: 18, width: 140),
            const SizedBox(height: 16),
            ...List.generate(2, (_) => _taskSkeleton()),
          ],
        ),
      ),
    );
  }

  Widget _taskSkeleton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomShimmer(height: 16, width: 260),
          const SizedBox(height: 14),
          ...List.generate(2, (_) => _taskFileSkeleton()),
        ],
      ),
    );
  }

  Widget _taskFileSkeleton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      child: Row(
        children: [
          CustomShimmer(height: 44, width: 44, borderRadius: 8),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomShimmer(height: 14, width: 160),
                SizedBox(height: 8),
                CustomShimmer(
                  height: 6,
                  width: double.infinity,
                  borderRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const CustomShimmer(height: 28, width: 28, isCircle: true),
        ],
      ),
    );
  }

  Widget _tasksWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return state.maybeMap(
            loading:
                (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppConstants.defaultPadding * 2),
                    const CustomShimmer(height: 18, width: 180),
                    const SizedBox(height: 16),
                    ...List.generate(2, (_) => _taskSkeleton()),
                  ],
                ),
            loaded: (value) {
              if (value.tasks.isEmpty) return const SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppConstants.defaultPadding * 2),
                  Text(
                    "lesson_tasks".tr(
                      namedArgs: {"count": "${value.tasks.length}"},
                    ),
                    style: AppTextStyles.titleMedium,
                  ),
                  const SizedBox(height: AppConstants.defaultPadding / 2),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.tasks.length,
                    itemBuilder:
                        (context, index) =>
                            _taskTile(value.tasks[index], context),
                  ),
                ],
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _taskTile(TaskEntity task, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(AppConstants.defaultPadding + 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              AppConstants.defaultBorderRadius,
            ),
          ),
          child: Text(
            task.description,
            style: AppTextStyles.caption.copyWith(fontSize: 14),
          ),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        ...task.files.map((file) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                AppConstants.defaultBorderRadius,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgWidget(
                        icon: Assets.assetsIconsList,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(file.name, style: AppTextStyles.titleSmall),
                      ValueListenableBuilder<int>(
                        valueListenable: file.status,
                        builder: (_, status, __) {
                          final isRunning =
                              status == DownloadTaskStatus.running.index;
                          return isRunning
                              ? ValueListenableBuilder<double?>(
                                valueListenable: file.progress,
                                builder:
                                    (_, prog, __) => Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          LinearProgressIndicator(
                                            value:
                                                (prog ?? 0) > 0
                                                    ? (prog ?? 0) / 100
                                                    : null,
                                            backgroundColor: Colors.grey[300],
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                  Color
                                                >(AppColors.primaryColor),
                                          ),
                                          const SizedBox(height: 4),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${(prog ?? 0).toInt()}%',
                                              style: AppTextStyles.caption
                                                  .copyWith(
                                                    color: Colors.grey[700],
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              )
                              : const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<bool?>(
                  valueListenable: file.isDownloaded,
                  builder: (_, downloaded, __) {
                    return IconButton(
                      onPressed: () {
                        final status = DownloadTaskStatus.fromInt(
                          file.status.value,
                        );
                        if (downloaded == true &&
                            file.taskId.value.isNotEmpty) {
                          DownloadService.openFile(file.url);
                        } else if (status == DownloadTaskStatus.failed) {
                          context.read<TaskBloc>().add(
                            TaskEvent.retryDownload(file: file),
                          );
                        } else {
                          context.read<TaskBloc>().add(
                            TaskEvent.downloadFile(file: file),
                          );
                        }
                      },
                      icon: _buildDownloadIcon(file),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDownloadIcon(TaskFileEntity file) {
    final downloaded = file.isDownloaded.value == true;
    if (downloaded) {
      return const Icon(Icons.check_circle, color: Colors.green);
    }
    final status = DownloadTaskStatus.fromInt(file.status.value);
    switch (status) {
      case DownloadTaskStatus.running:
        return SizedBox(
          width: 28,
          height: 28,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ValueListenableBuilder<double?>(
                valueListenable: file.progress,
                builder:
                    (_, prog, __) => CircularProgressIndicator(
                      strokeWidth: 2,
                      value: (prog ?? 0) > 0 ? (prog ?? 0) / 100 : null,
                    ),
              ),
              ValueListenableBuilder<double?>(
                valueListenable: file.progress,
                builder:
                    (_, prog, __) => Text(
                      '${(prog ?? 0).toInt()}',
                      style: const TextStyle(fontSize: 10),
                    ),
              ),
            ],
          ),
        );
      case DownloadTaskStatus.failed:
        return const Icon(Icons.refresh, color: Colors.red);
      case DownloadTaskStatus.enqueued:
        return const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      default:
        return SvgWidget(icon: Assets.assetsIconsDownload);
    }
  }
}
