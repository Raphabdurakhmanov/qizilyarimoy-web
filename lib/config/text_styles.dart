import 'package:app/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();
  // Font Weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  static TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: semiBold,
    color: Colors.black,
  );
  static TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: semiBold,
    color: Colors.black,
  );
  static TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: semiBold,
    color: Colors.black,
  );
  static TextStyle button = TextStyle(
    fontSize: 17,
    fontWeight: semiBold,
    color: Colors.black,
    height: 1.3,
  );
  static TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: medium,
    color: Colors.black,
  );
  static TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: regular,
    color: AppColors.gray4,
  );
}
