import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/snacbars/custom_snacbar.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_text_field.dart';
import 'package:app/features/home/presentation/bloc/feedback/feedback_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  final ValueNotifier<String?> _selectedRegion = ValueNotifier(
    regionsData.first,
  );

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    _selectedRegion.dispose();
    super.dispose();
  }

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: const CustomBackButton(backgroundColor: Colors.white),
      ),
      body: BlocListener<FeedbackBloc, FeedbackState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            loading: (_) {
              isLoading.value = true;
            },
            loaded: (_) {
              // Handle success state
              isLoading.value = false;
              context.pop();
              showCustomSnacbar(
                context,
                message: "feedback_sent_successfully".tr(),
                type: SnacbarType.success
              );
            },
            error: (state) {
              isLoading.value = false;
              showCustomSnacbar(context, message: state.message);
            },
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            children: [
              Image.asset(Assets.assetsImagesNewsletter, width: 64, height: 64),
              const SizedBox(height: AppConstants.defaultPadding),
              Text(
                'send_feedback'.tr(),
                style: AppTextStyles.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.defaultPadding / 2),
              Text(
                'feedback_description'.tr(),
                style: AppTextStyles.caption,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.defaultPadding * 2),
              Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    AppConstants.defaultBorderRadius,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      titleText: 'full_name'.tr(),
                      controller: _fullNameController,
                      hintText: 'enter'.tr(),
                      fillColor: AppColors.backgroundColor,
                    ),
                    const SizedBox(height: AppConstants.defaultPadding),
                    CustomTextField(
                      titleText: 'phone_number'.tr(),
                      controller: _phoneController,
                      hintText: 'enter'.tr(),
                      keyboardType: TextInputType.phone,
                      fillColor: AppColors.backgroundColor,
                    ),
                    const SizedBox(height: AppConstants.defaultPadding),
                    _buildRegionDropdown(),
                    const SizedBox(height: AppConstants.defaultPadding),
                    CustomTextField(
                      titleText: 'your_feedback'.tr(),
                      controller: _messageController,
                      hintText: 'enter'.tr(),
                      maxLines: 5,
                      fillColor: AppColors.backgroundColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.defaultPadding * 2),
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (context, value, child) {
                  return CustomButton(
                    onPressed: () {
                      if (_fullNameController.text.isEmpty ||
                          _phoneController.text.isEmpty ||
                          _selectedRegion.value == null ||
                          _messageController.text.isEmpty) {
                        showCustomSnacbar(
                          context,
                          message: 'please_fill_all_fields'.tr(),
                        );
                        return;
                      }
                      context.read<FeedbackBloc>().add(
                        FeedbackEvent.sendFeedback(
                          fullName: _fullNameController.text,
                          phone: _phoneController.text,
                          region: _selectedRegion.value ?? '',
                          content: _messageController.text,
                        ),
                      );
                    },
                    isLoading: value,
                    text: 'send'.tr(),
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                  );
                },
              ),
              const SizedBox(height: AppConstants.defaultPadding),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegionDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('region'.tr(), style: AppTextStyles.titleSmall),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.textFieldHorizontalPadding,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(
              AppConstants.defaultBorderRadius,
            ),
            border: Border.all(color: AppColors.gray1, width: 1.0),
          ),
          child: ValueListenableBuilder<String?>(
            valueListenable: _selectedRegion,
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                value: value,
                items:
                    regionsData.map((String region) {
                      return DropdownMenuItem<String>(
                        value: region,
                        child: Text(region.tr()),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  _selectedRegion.value = newValue;
                },
                decoration: const InputDecoration(border: InputBorder.none),
                icon: const Icon(Icons.keyboard_arrow_down),
              );
            },
          ),
        ),
      ],
    );
  }
}
