import 'package:app/config/app_colors.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.text,
    this.trailing,
    required this.onTap,
    this.isLast = false,
  });

  final String icon;
  final String text;
  final Widget? trailing;
  final VoidCallback onTap;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.defaultBorderRadius,
            ),
          ),
          leading: SvgWidget(icon: icon, width: 24, height: 24),
          title: Text(text, style: AppTextStyles.bodyMedium),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: AppConstants.defaultPadding),
              if (trailing != null) trailing!,
              const SizedBox(width: AppConstants.defaultPadding / 2),
              Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.gray4),
            ],
          ),
        ),
        if (!isLast)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.backgroundColor,
          ),
      ],
    );
  }
}
