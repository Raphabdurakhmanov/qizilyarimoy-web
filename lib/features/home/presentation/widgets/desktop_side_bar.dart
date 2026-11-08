import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/widgets/image_widget.dart' show SvgWidget;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Left menu for the desktop layout (replaces the bottom nav bar).
class DesktopSideBar extends StatelessWidget {
  const DesktopSideBar({super.key, required this.pageIndex});

  final ValueNotifier<int> pageIndex;

  @override
  Widget build(BuildContext context) {
    final items = [
      (Assets.assetsIconsList, 'feed'.tr()),
      (Assets.assetsIconsCourse, 'courses'.tr()),
      (Assets.assetsIconsLeaderboard, 'rating'.tr()),
      (Assets.assetsIconsPerson, 'profile'.tr()),
    ];

    return Container(
      width: 250,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(Assets.assetsLogo, width: 40, height: 40),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Qizil Yarim Oy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ValueListenableBuilder<int>(
            valueListenable: pageIndex,
            builder: (context, current, _) {
              return Column(
                children: [
                  for (var i = 0; i < items.length; i++)
                    _SideBarItem(
                      icon: items[i].$1,
                      label: items[i].$2,
                      selected: current == i,
                      onTap: () => pageIndex.value = i,
                    ),
                ],
              );
            },
          ),
          const Spacer(),
          Text(
            '© Qizil Yarim Oy',
            style: TextStyle(fontSize: 12, color: AppColors.gray3),
          ),
        ],
      ),
    );
  }
}

class _SideBarItem extends StatelessWidget {
  const _SideBarItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: selected ? AppColors.redLight : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                SvgWidget(
                  icon: icon,
                  color: selected ? AppColors.primaryColor : AppColors.gray3,
                ),
                const SizedBox(width: 14),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    color:
                        selected ? AppColors.primaryColor : AppColors.gray4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
