import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_progress_indicator.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/custom_star_rating.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/core/di/injector.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/course/presentation/widgets/module_tile.dart';
import 'package:app/features/lenta/presentation/widgets/comment_tile.dart';
import 'package:app/features/profile/domain/entities/mycourse_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourseAboutScreen extends StatefulWidget {
  const MyCourseAboutScreen({super.key, required this.myCourse});
  final MyCourseEntity myCourse;
  @override
  State<MyCourseAboutScreen> createState() => _MyCourseAboutScreenState();
}

class _MyCourseAboutScreenState extends State<MyCourseAboutScreen> {
  MyCourseEntity get course => widget.myCourse;
  @override
  void initState() {
    super.initState();
    courseBloc.add(
      CourseDetailsEvent.fetchCourseModules(widget.myCourse.course!),
    );
    courseDetailsBloc.add(
      CourseDetailsEvent.getCourseDetails(widget.myCourse.course!),
    );
    courseCommentsBloc.add(
      CourseDetailsEvent.fetchComments(widget.myCourse.course!),
    );
  }

  final courseBloc = sl<CourseDetailsBloc>();
  final courseDetailsBloc = sl<CourseDetailsBloc>();
  final courseCommentsBloc = sl<CourseDetailsBloc>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("course_title".tr(), style: AppTextStyles.titleMedium),
        leading: CustomBackButton(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgWidget(icon: Assets.assetsIconsInstructions),
            onPressed: () {
              _showCustomModalBottomSheet(size);
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _courseStats(size),
          BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
            bloc: courseBloc,
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => SizedBox.shrink(),
                loading:
                    (_) => ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.defaultPadding,
                            vertical: AppConstants.defaultPadding / 2,
                          ),
                          child: CustomShimmer(
                            height: 60,
                            width: double.infinity,
                          ),
                        );
                      },
                      itemCount: 5,
                    ),
                loaded: (loadedState) {
                  final modules = loadedState.modules ?? [];
                  if (modules.isEmpty) {
                    return Center(child: Text("no_modules_found".tr()));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ModuleExpansionTile(module: modules[index]);
                      },
                      itemCount: modules.length,
                      shrinkWrap: true,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _courseStats(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.defaultPadding,
      ),
      color: Colors.white,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: SizedBox(
            width: 60,
            height: 60,
            child: CustomPaint(
              painter: CircleProgressPainter(course.progress ?? 0.0),
              child: Center(
                child: Text(
                  '${course.progress!.toInt()}%',
                  style: AppTextStyles.titleSmall.copyWith(
                    fontWeight: AppTextStyles.medium,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            course.courseTitle ?? "",
            style: AppTextStyles.titleSmall.copyWith(fontSize: 14),
          ),
          subtitle: Text(
            "${course.completedTasks ?? 0}/${course.totalTasks ?? 0}",
            style: AppTextStyles.caption.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }

  void _showCustomModalBottomSheet(Size size) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            // height: size.height * .9,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
              bloc: courseDetailsBloc,
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => SizedBox.shrink(),
                  loading:
                      (value) => SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  loaded: (value) {
                    final course = value.courseDetails;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: ColoredBox(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                AppConstants.defaultPadding,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: AppConstants.defaultPadding,
                                  ),
                                  Text(
                                    "about_this_course".tr(),
                                    style: AppTextStyles.titleMedium,
                                  ),
                                  SizedBox(height: AppConstants.defaultPadding),
                                  AspectRatio(
                                    aspectRatio: 18 / 9,
                                    child: ImageWidget(
                                      imageUrl: course?.image ?? '',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                            AppConstants.defaultPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                course?.title ?? '',
                                style: AppTextStyles.titleLarge.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: AppConstants.defaultPadding,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      StarRatingWidget(
                                        starSize: 16,
                                        isClickable: false,
                                        rating: (course?.rating ?? 0),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        (course?.rating ?? 0).toString(),
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
                                        course!.studentsCount.toString(),
                                        style: AppTextStyles.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: AppConstants.defaultPadding - 4,
                              ),
                              Text(
                                course.description ?? "",
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.gray4,
                                  fontSize: 16,
                                ),
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: AppConstants.defaultPadding,
                                  top: AppConstants.defaultPadding * 2,
                                  bottom: AppConstants.defaultPadding,
                                ),
                                child: Text(
                                  "comments".tr(
                                    namedArgs: {'count': "0".toString()},
                                  ),
                                  style: AppTextStyles.titleMedium,
                                ),
                              ),
                              _commentSection(),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _commentSection() {
    return BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
      bloc: courseCommentsBloc,
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => SizedBox.shrink(),
          loadedComments: (value) {
            final comments = value.comments ?? [];
            if (comments.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                  ),
                  child: SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.assetsImagesNoComments, width: 64),
                        Text("no_comments".tr()),
                      ],
                    ),
                  ),
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return CommentTile(
                  comment: comments[index],
                  isLenta: true,
                  onReply: (id) => null,
                );
              },
            );
          },
        );
      },
    );
  }
}
