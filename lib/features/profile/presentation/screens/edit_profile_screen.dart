import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/snacbars/custom_snacbar.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_loading.dart';
import 'package:app/config/widgets/custom_text_field.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/core/di/injector.dart';
import 'package:app/features/profile/domain/entities/profile_entity.dart';
import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.profile});
  final ProfileEntity profile;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _loginController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();

  final ValueNotifier<bool> _changePassword = ValueNotifier(false);
  final ValueNotifier<bool> _isOldPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isNewPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isRepeatNewPasswordVisible = ValueNotifier(false);

  final ValueNotifier<String?> _selectedRegion = ValueNotifier(null);

  late final BuildContext routeOfContext;
  @override
  void initState() {
    super.initState();
    routeOfContext = context;
    _selectedRegion.value = widget.profile.region;
    var names = widget.profile.fullName?.split(" ").toList() ?? ["", ""];
    _loginController.text = widget.profile.username ?? "";
    _firstNameController.text = names.first;
    if (names.length == 2) {
      _lastNameController.text = names.last;
    }
  }

  final bloc = sl<UserBloc>();
  @override
  void dispose() {
    _loginController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();
    _changePassword.dispose();
    _isOldPasswordVisible.dispose();
    _isNewPasswordVisible.dispose();
    _isRepeatNewPasswordVisible.dispose();
    super.dispose();
  }

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      bloc: bloc,
      listener: (BuildContext context, UserState state) {
        state.maybeWhen(
          orElse: () {},
          changedPassword: () {
            isLoading.value = false;
            showCustomSnacbar(
              context,
              message: "password_changed".tr(),
              type: SnacbarType.success,
            );
            context.pop();
          },
          loading: () {
            isLoading.value = true;
          },
          updatedProfile: () {
            showCustomSnacbar(
              context,
              message: "profile_updated".tr(),
              type: SnacbarType.success,
            );
            routeOfContext.read<UserBloc>().add(UserEvent.getProfile());
            if (_changePassword.value) {
              String oldPassStr = _oldPasswordController.text.trim();
              String newPassStr = _newPasswordController.text.trim();
              bloc.add(
                UserEvent.changePassword(
                  oldPassword: oldPassStr,
                  newPassword: newPassStr,
                ),
              );
            } else {
              context.pop();
            }
          },
          error: (message) {
            isLoading.value = false;
            showCustomSnacbar(context, message: message.message);
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: const CustomBackButton(),
          centerTitle: true,
          title: Text('edit_title'.tr(), style: AppTextStyles.titleMedium),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (context, value, child) {
                    return isLoading.value
                        ? CustomLoading()
                        : SvgWidget(
                          icon: Assets.assetsIconsCheck,
                          color: Colors.white,
                          width: 20,
                        );
                  },
                ),
                onPressed: () {
                  String? regionStr = _selectedRegion.value;
                  print(regionStr);
                  String firstNameStr = _firstNameController.text.trim();
                  String lastNameStr = _lastNameController.text.trim();
                  if (firstNameStr.isEmpty && lastNameStr.isEmpty) {
                    showCustomSnacbar(context, message: "enter_fields".tr());
                    return;
                  }
                  if (_changePassword.value) {
                    String oldPassStr = _oldPasswordController.text.trim();
                    String newPassStr = _newPasswordController.text.trim();
                    String confirmPassStr =
                        _repeatNewPasswordController.text.trim();

                    if (oldPassStr.isEmpty ||
                        newPassStr.isEmpty ||
                        confirmPassStr.isEmpty) {
                      showCustomSnacbar(context, message: "enter_fields".tr());
                      return;
                    }
                    if (newPassStr != confirmPassStr) {
                      showCustomSnacbar(
                        context,
                        message: "passwords_do_not_match".tr(),
                      );
                      return;
                    }
                    if (newPassStr.length < 4) {
                      showCustomSnacbar(
                        context,
                        message: "password_length_error".tr(),
                      );
                      return;
                    }
                  }

                  bloc.add(
                    UserEvent.updateProfile(
                      firstName: firstNameStr,
                      lastName: lastNameStr,
                      region: regionStr,
                    ),
                  );
                },
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.checkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 10),
            child: SizedBox.shrink(),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                titleText: 'edit_login'.tr(),
                controller: _loginController,
                fillColor: Colors.white,
                readOnly: true,
              ),
              const SizedBox(height: AppConstants.defaultSpace),
              CustomTextField(
                titleText: 'first_name'.tr(),
                controller: _firstNameController,
                fillColor: Colors.white,
              ),
              const SizedBox(height: AppConstants.defaultSpace),
              CustomTextField(
                titleText: 'last_name'.tr(),
                controller: _lastNameController,
                fillColor: Colors.white,
              ),
              const SizedBox(height: AppConstants.defaultSpace),
              _buildRegionDropdown(),
              const SizedBox(height: AppConstants.defaultSpace),
              _buildChangePasswordSection(),
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
          child: Text('edit_region'.tr(), style: AppTextStyles.titleSmall),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.textFieldHorizontalPadding,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              AppConstants.defaultBorderRadius,
            ),
            border: Border.all(color: AppColors.gray1, width: 1.0),
          ),
          child: ValueListenableBuilder(
            valueListenable: _selectedRegion,
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                value: _selectedRegion.value,
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

  Widget _buildChangePasswordSection() {
    return ValueListenableBuilder<bool>(
      valueListenable: _changePassword,
      builder: (context, isEnabled, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('change_password'.tr(), style: AppTextStyles.titleMedium),
                Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    _changePassword.value = value;
                  },
                  activeColor: AppColors.primaryColor,
                ),
              ],
            ),
            if (isEnabled) ...[
              const SizedBox(height: AppConstants.defaultSpace),
              _buildPasswordTextField(
                title: 'old_password'.tr(),
                controller: _oldPasswordController,
                visibilityNotifier: _isOldPasswordVisible,
              ),
              const SizedBox(height: AppConstants.defaultSpace),
              _buildPasswordTextField(
                title: 'new_password'.tr(),
                controller: _newPasswordController,
                visibilityNotifier: _isNewPasswordVisible,
              ),
              const SizedBox(height: AppConstants.defaultSpace),
              _buildPasswordTextField(
                title: 'repeat_new_password'.tr(),
                controller: _repeatNewPasswordController,
                visibilityNotifier: _isRepeatNewPasswordVisible,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildPasswordTextField({
    required String title,
    required TextEditingController controller,
    required ValueNotifier<bool> visibilityNotifier,
  }) {
    return ValueListenableBuilder<bool>(
      valueListenable: visibilityNotifier,
      builder: (context, isVisible, child) {
        return CustomTextField(
          titleText: title,
          controller: controller,
          obscureText: !isVisible,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.gray3,
            ),
            style: IconButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              visibilityNotifier.value = !isVisible;
            },
          ),
        );
      },
    );
  }
}
