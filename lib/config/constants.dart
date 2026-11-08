import 'package:easy_localization/easy_localization.dart';

class AppConstants {
  AppConstants._();
  static const String appName = 'Qizil YarimOy';
  static const String appVersion = '1.0.0';

  // padding
  static const double defaultPadding = 12.0;
  static const double defaultSpace = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double textFieldHorizontalPadding = 18.0;

  static const String defaultImage =
      "https://upload.wikimedia.org/wikipedia/commons/e/ec/Red_Crescent_Society_of_Uzbekistan_logo.svg";
  static const String defaultAvatar =
      "https://cdn-icons-png.flaticon.com/512/6897/6897018.png";
}

final List<String> regionsData = [
  'tashkent',
  'samarkand',
  'bukhara',
  'andijan',
  'fergana',
  'namangan',
  'kashkadarya',
  'surkhandarya',
  'khorezm',
  'karakalpakstan',
  'navoi',
  'jizzakh',
  'sirdarya',
];
final List<String> regionsDataWithTranslate = [
  'tashkent'.tr(),
  'samarkand'.tr(),
  'bukhara'.tr(),
  'andijan'.tr(),
  'fergana'.tr(),
  'namangan'.tr(),
  'kashkadarya'.tr(),
  'surkhandarya'.tr(),
  'khorezm'.tr(),
  'karakalpakstan'.tr(),
  'navoi'.tr(),
  'jizzakh'.tr(),
  'sirdarya'.tr(),
];
const Duration tokenExpiredDuration = Duration(days: 1);
String? accessToken;
String? refreshTokenData;
DateTime? tokenExpirationDate;
