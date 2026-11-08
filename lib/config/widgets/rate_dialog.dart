import 'package:app/config/app_colors.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_star_rating.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/course/presentation/bloc/rating/rating_bloc.dart';

class RateCourseDialog extends StatefulWidget {
  const RateCourseDialog({
    super.key,
    required this.courseId,
    required this.onRated,
  });
  final int courseId;
  final Function(bool) onRated;

  @override
  State<RateCourseDialog> createState() => _RateCourseDialogState();
}

class _RateCourseDialogState extends State<RateCourseDialog> {
  double lessonClarityRating = 0;
  double materialUsefulnessRating = 0;
  double materialPresentationRating = 0;
  double platformQualityRating = 0;
  double overallImpressionRating = 0;

  bool get _allRated =>
      lessonClarityRating > 0 &&
      materialUsefulnessRating > 0 &&
      materialPresentationRating > 0 &&
      platformQualityRating > 0 &&
      overallImpressionRating > 0;

  int get _finalRating {
    final avg =
        (lessonClarityRating +
            materialUsefulnessRating +
            materialPresentationRating +
            platformQualityRating +
            overallImpressionRating) /
        5.0;
    return avg.round().clamp(1, 5);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingBloc, RatingState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            context.pop();
            widget.onRated(true);
          },
          error: (msg) {
            context.pop();
            widget.onRated(false);
          },
          orElse: () {},
        );
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: contentBox(context),
      ),
    );
  }

  Widget contentBox(BuildContext context) {
    final ratingState = context.watch<RatingBloc>().state;
    final isLoading = ratingState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: Text(
                    "rate_course_title".tr(),
                    style: AppTextStyles.titleMedium.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildRatingRow(
              "lesson_clarity".tr(),
              (v) => setState(() => lessonClarityRating = v),
            ),
            const Divider(),
            _buildRatingRow(
              "material_usefulness".tr(),
              (v) => setState(() => materialUsefulnessRating = v),
            ),
            const Divider(),
            _buildRatingRow(
              "material_presentation".tr(),
              (v) => setState(() => materialPresentationRating = v),
            ),
            const Divider(),
            _buildRatingRow(
              "platform_quality".tr(),
              (v) => setState(() => platformQualityRating = v),
            ),
            const Divider(),
            _buildRatingRow(
              "overall_impression".tr(),
              (v) => setState(() => overallImpressionRating = v),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: "send".tr(),
              onPressed:
                  !_allRated || isLoading
                      ? () {}
                      : () {
                        context.read<RatingBloc>().add(
                          RatingEvent.submit(
                            courseId: widget.courseId,
                            rating: _finalRating,
                          ),
                        );
                      },
              isLoading: isLoading,
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(String title, Function(double) onRatingChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray4),
          ),
          const SizedBox(height: 8),
          StarRatingWidget(
            starSize: 32,
            allowHalfRating: false,
            onRatingChanged: onRatingChanged,
          ),
        ],
      ),
    );
  }
}

void showRateCourseDialog(
  BuildContext context, {
  required int courseId,
  required Function(bool) onRated,
}) {
  showDialog(
    context: context,
    builder:
        (_) => BlocProvider.value(
          value: context.read<RatingBloc>(),
          child: RateCourseDialog(courseId: courseId, onRated: onRated),
        ),
  );
}
