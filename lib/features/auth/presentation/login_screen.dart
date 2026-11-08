import 'package:app/config/app_colors.dart';
import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/snacbars/custom_snacbar.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_text_field.dart';
import 'package:app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    debugPaintSizeEnabled = false;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            // Show loading indicator if needed
          },
          authenticated: (user, tokenRefreshed) {

            context.go(AppRoutes.home);
          },
          unauthenticated: (message) {
            showCustomSnacbar(context, message: message);
          },
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Assets.assetsImagesLogin,
              height: (size.height * .45),
              width: size.width,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: (size.height * .6022),
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                  // vertical: AppConstants.defaultPadding,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'login_first'.tr(),
                            style: AppTextStyles.titleLarge,
                            children: [
                              TextSpan(text: " "),
                              TextSpan(
                                text: 'login_second'.tr(),
                                style: AppTextStyles.titleLarge.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: AppConstants.defaultSpace),
                      CustomTextField(
                        titleText: "sign_in".tr(),
                        hintText: 'enter_login'.tr(),
                        controller: usernameController,
                      ),
                      SizedBox(height: AppConstants.defaultSpace),
                      ValueListenableBuilder<bool>(
                        valueListenable: isPasswordVisible,
                        builder: (context, isVisible, child) {
                          return CustomTextField(
                            titleText: "password".tr(),
                            hintText: 'enter_password'.tr(),
                            controller: passwordController,
                            obscureText: isPasswordVisible.value,
                            suffixIcon: IconButton(
                              icon: ValueListenableBuilder<bool>(
                                valueListenable: isPasswordVisible,
                                builder: (context, isVisible, child) {
                                  return Icon(
                                    isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.titleColor,
                                  );
                                },
                              ),
                              onPressed: () {
                                isPasswordVisible.value =
                                    !isPasswordVisible.value;
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppConstants.defaultSpace),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );
                          return CustomButton(
                            onPressed: () {
                              String usernameStr =
                                  usernameController.text.trim();
                              String passwordStr =
                                  passwordController.text.trim();
                              if (usernameStr.isEmpty || passwordStr.isEmpty) {
                                showCustomSnacbar(
                                  context,
                                  message: 'enter_fields'.tr(),
                                  type: SnacbarType.error,
                                );
                                return;
                              }
                              if (passwordStr.length < 4) {
                                showCustomSnacbar(
                                  context,
                                  message: 'password_length_error'.tr(),
                                  type: SnacbarType.error,
                                );
                                return;
                              }
                              context.read<AuthBloc>().add(
                                AuthEvent.login(
                                  username: usernameController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                            },
                            text: 'login'.tr(),
                            isLoading: isLoading,
                            backgroundColor: AppColors.primaryColor,
                            textColor: Colors.white,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
