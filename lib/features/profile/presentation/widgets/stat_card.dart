import 'package:app/config/app_colors.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final String value;
  final String icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.statsColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.black.withValues(alpha: 0.04),
          //   blurRadius: 20,
          //   offset: const Offset(0, 10),
          // ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.bodyMedium, maxLines: 2),
          const SizedBox(height: AppConstants.defaultPadding),
          Row(
            children: [
              SvgWidget(icon: icon, color: iconColor, width: 24, height: 24),
              Spacer(),
              Text(
                value,
                style: AppTextStyles.titleMedium.copyWith(fontSize: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
