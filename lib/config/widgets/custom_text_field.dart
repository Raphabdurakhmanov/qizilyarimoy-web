import 'package:app/config/app_colors.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final bool readOnly;
  final bool autofocus;

  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  final String? titleText;
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.onChanged,
    this.validator,
    this.titleText,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (titleText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(titleText!, style: AppTextStyles.titleSmall),
          ),
        Container(
          decoration: BoxDecoration(
            color:
                readOnly
                    ? fillColor?.withValues(alpha: .8) ??
                        AppColors.backgroundColor.withValues(alpha: .8)
                    : fillColor ?? AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppConstants.defaultBorderRadius,
            ),
            border: Border.all(
              color: borderColor ?? AppColors.gray1,
              width: 1.0,
            ),
          ),
          padding:
              suffixIcon != null
                  ? EdgeInsets.only(
                    left: AppConstants.textFieldHorizontalPadding,
                  )
                  : prefixIcon != null
                  ? EdgeInsets.only(
                    right: AppConstants.textFieldHorizontalPadding,
                  )
                  : EdgeInsets.symmetric(
                    horizontal: AppConstants.textFieldHorizontalPadding,
                  ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: maxLines,
            onChanged: onChanged,
            readOnly: readOnly,
            autofocus: autofocus,
            validator: validator,
            focusNode: focusNode,
            textAlignVertical:
                suffixIcon != null || prefixIcon != null
                    ? TextAlignVertical.center
                    : null,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              // filled: fillColor != null,
              // fillColor: fillColor,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
