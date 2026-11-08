import 'package:app/config/app_colors.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/locales.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  late Locale _selectedLocale;


  @override
  Widget build(BuildContext context) {
    _selectedLocale = context.locale;
    return Container(
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.gray1,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(AppConstants.defaultBorderRadius),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(AppConstants.defaultBorderRadius),
                    ),
                  ),
                  child: Text(
                    'language'.tr(),
                    style: AppTextStyles.titleMedium.copyWith(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(AppConstants.defaultBorderRadius),
              ),
            ),
            child: Column(
              children: [
                ...supportedLanguagesMap.entries.map((entry) {
                  final languageName = entry.key;
                  final locale = entry.value;
                  final isSelected = _selectedLocale == locale;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          languageName,
                          style: AppTextStyles.bodyMedium,
                        ),
                        trailing:
                            isSelected
                                ? Icon(
                                  Icons.check,
                                  color: AppColors.primaryColor,
                                )
                                : null,
                        onTap: () {
                          context.setLocale(locale);
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,

                        color: AppColors.backgroundColor,
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'save'.tr(),
                  onPressed: () {
                    if (context.locale != _selectedLocale) {
                      context.setLocale(_selectedLocale);
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
