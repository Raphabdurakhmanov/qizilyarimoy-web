import 'package:app/config/app_colors.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FilterRatingWidget extends StatelessWidget {
  const FilterRatingWidget({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(color: AppColors.white),
      padding: const EdgeInsets.only(
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
        bottom: AppConstants.defaultPadding,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TabBar(
          tabs: [
            Tab(text: "rating_productivity".tr()),
            Tab(text: 'rating_for'.tr()),
          ],
          indicator: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black.withValues(alpha: .08),
              ),
            ],
          ),
          padding: const EdgeInsets.all(4),
          dividerHeight: 0,
          labelColor: AppColors.gray4,
          unselectedLabelColor: AppColors.gray3,
          labelStyle: AppTextStyles.bodyMedium,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
        ),
      ),
    );
  }
}
