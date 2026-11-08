import 'package:app/config/app_colors.dart';
import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/snacbars/custom_snacbar.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/comment_input_widget.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/custom_star_rating.dart';
import 'package:app/config/widgets/html_view_widget.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/core/di/injector.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/course/presentation/widgets/module_tile.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/presentation/widgets/comment_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app/config/widgets/rate_dialog.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.course});
  final CourseEntity course;
  @override
  CourseDetailsScreenState createState() => CourseDetailsScreenState();
}

class CourseDetailsScreenState extends State<CourseDetailsScreen>
    with TickerProviderStateMixin {
  late CourseEntity course;
  ValueNotifier<int> selectedTabIndex = ValueNotifier<int>(0);
  late TabController tabController;
  List<CommentEntity> comments = [];

  // For writing comments
  ValueNotifier<CommentEntity?> parentComment = ValueNotifier(null);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<bool> hasReachedMax = ValueNotifier(false);
  ValueNotifier<int> commentsCount = ValueNotifier(0);
  ValueNotifier<LessonEntity?> activeLesson = ValueNotifier(null);

  final TextEditingController _commentController = TextEditingController();
  FocusNode focusNode = FocusNode();

  final commentBloc = sl<CourseDetailsBloc>();
  final enrollCourseBloc = sl<CourseDetailsBloc>();
  final courseDetailsBloc = sl<CourseDetailsBloc>();
  @override
  void initState() {
    super.initState();
    course = widget.course;
    tabController = TabController(length: 2, vsync: this);
    courseDetailsBloc.add(CourseDetailsEvent.getCourseDetails(course.id!));
    context.read<CourseDetailsBloc>().add(
      CourseDetailsEvent.fetchCourseModules(course.id!),
    );
    // initialize Comment
    commentBloc.add(CourseDetailsEvent.fetchComments(course.id!));

    isLoading.value = true;
    commentsCount.value = 0;
    commentBloc.stream.listen((state) {
      state.maybeMap(
        orElse: () => isLoading.value = false,
        loaded: (value) {
          isLoading.value = false;
          if (value.isPostingComment) {
            commentBloc.add(CourseDetailsEvent.fetchComments(course.id!));
          }
        },
        loadedComments: (value) {
          isLoading.value = false;
          comments = value.comments?.toList() ?? [];
          int count = 0;
          for (CommentEntity element in (value.comments ?? [])) {
            count += element.replies?.length ?? 0;
          }
          commentsCount.value = (value.comments?.length ?? 0) + count;
          isLoading.value = false;
        },
        loading: (value) => isLoading.value = true,
      );
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    commentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CourseDetailsBloc, CourseDetailsState>(
        bloc: courseDetailsBloc,
        listener: (context, state) {
          course =
              state.mapOrNull(loaded: (value) => value.courseDetails) ?? course;
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 250.0,
                      floating: false,
                      pinned: true,
                      snap: false,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ImageWidget(
                          imageUrl: course.image ?? AppConstants.defaultImage,
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size(double.infinity, 20),
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      leading: CustomBackButton(color: AppColors.primaryColor),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(
                          AppConstants.defaultPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.title ?? '',
                              style: AppTextStyles.titleLarge.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: AppConstants.defaultPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    StarRatingWidget(
                                      starSize: 16,
                                      isClickable: false,
                                      rating: (course.rating ?? 0),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      (course.rating ?? 0).toString(),
                                      style: AppTextStyles.bodyMedium,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgWidget(
                                      icon: Assets.assetsIconsPeople,
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      course.studentsCount.toString(),
                                      style: AppTextStyles.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: AppConstants.defaultPadding - 4,
                            ),
                            TextWidget(
                              course.description ?? "",
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.gray4,
                                fontSize: 16,
                              ),
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 16), // Space after the app bar
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        selectedTabIndex,
                        commentsCount,
                        (value) {},
                      ),
                      pinned: false,
                    ),
                    SliverToBoxAdapter(
                      child: ValueListenableBuilder(
                        valueListenable: selectedTabIndex,
                        builder: (context, value, child) {
                          if (value == 1) {
                            // Comments Tab UI
                            return _courseComments();
                          }
                          // Modules Tab UI with BlocBuilder
                          return _modules();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: selectedTabIndex,
                builder: (context, value, child) {
                  if (value == 1) {
                    return _buildCommentInputField();
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: 16,
        ),
        child: BlocConsumer<CourseDetailsBloc, CourseDetailsState>(
          bloc: enrollCourseBloc,
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              loaded: (value) {
                courseDetailsBloc.add(
                  CourseDetailsEvent.getCourseDetails(course.id!),
                );
                context.push(
                  AppRoutes.courseStartLearning,
                  extra: {
                    "lesson": value.activeLesson ?? course.activeLesson.value,
                    "course": course.id,
                  },
                );
              },
            );
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (course.isCourseCompleted)
                  CustomButton(
                    isRounded: true,
                    onPressed: () {
                      showRateCourseDialog(
                        context,
                        courseId: course.id!,
                        onRated: (isRated) {
                          if (isRated) {
                            showCustomSnacbar(
                              context,
                              message: "course_rated_successfully".tr(),
                            );
                            courseDetailsBloc.add(
                              CourseDetailsEvent.getCourseDetails(course.id!),
                            );
                          }
                        },
                      );
                    },
                    isLoading:
                        state.mapOrNull(loading: (value) => true) == true,
                    text: "evaluation".tr(),
                  ),
                const SizedBox(height: 8),
                CustomButton(
                  onPressed: () {
                    if (course.isEnrolled) {
                      if (course.activeLesson.value != null) {
                        context.push(
                          AppRoutes.courseStartLearning,
                          extra: {
                            "lesson": course.activeLesson.value,
                            "course": course.id,
                          },
                        );
                      } else {
                        showCustomSnacbar(
                          context,
                          message: "no_active_lesson".tr(),
                        );
                      }
                    } else {
                      enrollCourseBloc.add(
                        CourseDetailsEvent.enrollCourse(course.id!),
                      );
                    }
                  },
                  isLoading: state.mapOrNull(loading: (value) => true) == true,
                  text:
                      course.isCourseCompleted
                          ? 'course_completed'.tr()
                          : (course.isEnrolled
                              ? 'continue_learning'.tr()
                              : "start_learning".tr()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _modules() {
    return BlocConsumer<CourseDetailsBloc, CourseDetailsState>(
      listener: (context, state) {
        state.maybeMap(
          loaded: (loadedState) {
            if (loadedState.modules != null &&
                loadedState.modules!.isNotEmpty) {
              activeLesson.value = loadedState.modules!.first.lessons?.first;
            } else {
              activeLesson.value = null;
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loading:
              (_) => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding,
                      vertical: AppConstants.defaultPadding / 2,
                    ),
                    child: CustomShimmer(height: 60, width: double.infinity),
                  );
                },
                itemCount: 5,
              ),
          error: (errorState) {
            if (errorState.failure is NetworkFailure) {
              return NoInternetWidget(
                onRetry: () {
                  context.read<CourseDetailsBloc>().add(
                    CourseDetailsEvent.fetchCourseModules(course.id!),
                  );
                },
              );
            }
            return Center(child: Text(errorState.failure.message));
          },
          loaded: (loadedState) {
            if (loadedState.modules?.isEmpty ?? true) {
              return SizedBox(
                height: 250,
                width: double.infinity,
                child: Center(child: Text("no_module_found".tr())),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: loadedState.modules!.length,
              itemBuilder: (context, index) {
                return ModuleExpansionTile(
                  module: loadedState.modules![index],
                  isEnrolled: course.isEnrolled,
                  courseId: course.id,
                );
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _courseComments() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      child: BlocConsumer<CourseDetailsBloc, CourseDetailsState>(
        bloc: commentBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (isLoading.value && comments.isEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                    vertical: AppConstants.defaultPadding / 2,
                  ),
                  child: CustomShimmer(height: 140, width: double.infinity),
                );
              },
              itemCount: 5,
            );
          }
          if (comments.isEmpty) {
            return SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.assetsImagesNoComments, width: 64),
                  Text("no_comments".tr()),
                ],
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.defaultPadding,
            ),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return CommentTile(
                comment: comments[index],
                onReply: (id) {
                  parentComment.value = id;
                  _commentController.text = '';
                  focusNode.requestFocus();
                  isLoading.value = false;
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCommentInputField() {
    return CommentInputWidget(
      parentComment: parentComment,
      commentController: _commentController,
      focusNode: focusNode,
      isLoading: isLoading,
      commentBloc: commentBloc,
      id: course.id!,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.index, this.commentCount, this.onTap);

  final ValueNotifier<int> index;
  final ValueNotifier<int> commentCount;
  final Function(int) onTap;
  @override
  double get minExtent => 42.0;
  @override
  double get maxExtent => 42.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
          ),
          child: SizedBox(
            height: 42.0,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () {
                      index.value = 0;
                      onTap(index.value);
                    },
                    borderRadius: BorderRadius.circular(
                      AppConstants.defaultBorderRadius,
                    ),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            value == 0
                                ? AppColors.primaryColor.withValues(alpha: .1)
                                : Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppConstants.defaultBorderRadius,
                        ),
                        border:
                            value == 0
                                ? Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1,
                                )
                                : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgWidget(icon: Assets.assetsIconsPlay),
                          const SizedBox(width: 8),
                          Text(
                            "modules".tr(),
                            style: AppTextStyles.titleSmall.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () {
                      index.value = 1;
                      onTap(index.value);
                    },
                    borderRadius: BorderRadius.circular(
                      AppConstants.defaultBorderRadius,
                    ),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            value == 1
                                ? AppColors.primaryColor.withValues(alpha: .1)
                                : Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppConstants.defaultBorderRadius,
                        ),
                        border:
                            value == 1
                                ? Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1,
                                )
                                : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgWidget(icon: Assets.assetsIconsComments),
                          const SizedBox(width: 8),
                          ValueListenableBuilder(
                            valueListenable: commentCount,
                            builder: (context, value, child) {
                              return Text(
                                "comments".tr(
                                  namedArgs: {"count": value.toString()},
                                ),
                                style: AppTextStyles.titleSmall.copyWith(
                                  fontSize: 16,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
