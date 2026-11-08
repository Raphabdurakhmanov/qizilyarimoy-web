import 'package:app/config/app_colors.dart';
import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_star_rating.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseTile extends StatelessWidget {
  final CourseEntity course;
  const CourseTile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      child: InkWell(
        onTap: () {
          context.push(AppRoutes.courseDetail, extra: course);
        },
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWidget(
                imageUrl:
                    course.image ??
                    "https://picsum.photos/200/300?random=${course.id}",
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
              const SizedBox(height: AppConstants.defaultPadding - 4),
              Row(
                children: [
                  StarRatingWidget(
                    starSize: 16,
                    isClickable: false,
                    rating: course.rating ?? 0,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    (course.rating ?? 0).toStringAsFixed(1),
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.defaultPadding - 4),
              Text(
                course.title ?? 'No title',
                style: AppTextStyles.titleSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgWidget(
                        icon: Assets.assetsIconsPeople,
                        color: AppColors.gray4,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        (course.studentsCount ?? 0).toString(),
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.defaultPadding - 4),
            ],
          ),
        ),
      ),
    );
  }
}
