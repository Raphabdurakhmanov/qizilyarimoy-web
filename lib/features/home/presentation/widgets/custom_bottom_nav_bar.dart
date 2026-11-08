import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/widgets/image_widget.dart' show SvgWidget;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomButtonNavigationBar extends StatelessWidget {
  const CustomButtonNavigationBar({super.key, required this.pageIndex});

  final ValueNotifier<int> pageIndex;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.defaultBorderRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, -6), // Shadow position
          ),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, value, child) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppConstants.defaultBorderRadius),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: value,
              selectedItemColor: AppColors.primaryColor,
              onTap: (value) {
                pageIndex.value = value;
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgWidget(icon: Assets.assetsIconsList),
                  activeIcon: SvgWidget(
                    icon: Assets.assetsIconsList,
                    color: AppColors.primaryColor,
                  ),
                  label: 'feed'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(icon: Assets.assetsIconsCourse),
                  activeIcon: SvgWidget(
                    icon: Assets.assetsIconsCourse,
                    color: AppColors.primaryColor,
                  ),
                  label: 'courses'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(icon: Assets.assetsIconsLeaderboard),
                  activeIcon: SvgWidget(
                    icon: Assets.assetsIconsLeaderboard,
                    color: AppColors.primaryColor,
                  ),
                  label: 'rating'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(icon: Assets.assetsIconsPerson),
                  activeIcon: SvgWidget(
                    icon: Assets.assetsIconsPerson,
                    color: AppColors.primaryColor,
                  ),
                  label: 'profile'.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
