import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';

import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_loading.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isLoading;
  final bool isRounded;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isLoading,
    this.isRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width, 50),
        backgroundColor:
            isRounded
                ? AppColors.backgroundColor
                : (backgroundColor ?? AppColors.primaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        textStyle: AppTextStyles.button,
        elevation: isRounded ? 0 : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side:
              isRounded
                  ? BorderSide(color: AppColors.primaryColor)
                  : BorderSide.none,
        ),
      ),
      child:
          isLoading == true
              ? CustomLoading()
              : Text(
                text,
                style: TextStyle(
                  color:
                      isRounded ? AppColors.gray4 : (textColor ?? Colors.white),
                ),
              ),
    );
  }
}

class LittleCustomButton extends StatelessWidget {
  const LittleCustomButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.backgroundColor = AppColors.backgroundColor,
    this.textStyle,
    this.iconColor,
  });
  final String icon;
  final String title;
  final TextStyle? textStyle;
  final Color? iconColor;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
      child: Row(
        children: [
          SvgWidget(icon: icon, color: iconColor),
          SizedBox(width: 5),
          Text(title, style: textStyle ?? AppTextStyles.titleSmall),
        ],
      ),
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.backgroundColor,
    this.textStyle,
    this.iconColor,
  });
  final String icon;
  final TextStyle? textStyle;
  final Color? iconColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: SvgWidget(icon: icon, color: iconColor),
        onPressed: onPressed,
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

// BackButton
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.color = Colors.black,
    this.backgroundColor,
  });
  final Color color;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: SvgWidget(icon: Assets.assetsIconsBack, color: color),
        onPressed: () {
          context.pop();
        },
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor ?? AppColors.backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
