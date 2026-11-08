import 'package:app/config/app_colors.dart';
import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/locales.dart';
import 'package:app/config/snacbars/custom_snacbar.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_loading.dart';
import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/core/di/injector.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/auth/data/model/user_collection.dart';
import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:app/features/profile/presentation/widgets/language_bottom_sheet.dart';
import 'package:app/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:app/features/profile/presentation/widgets/stat_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/config/widgets/custom_shimmer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/core/database/local_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ValueNotifier<String> languageName = ValueNotifier("");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      languageName.value = _getCurrentLanguageName(context);
    });
    context.read<UserBloc>().add(UserEvent.getProfile());
  }

  Future<void> _pickAndUploadAvatar() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (image != null) {
        if (mounted) {
          avatarBloc.add(UserEvent.changeAvatar(avatarPath: image.path));
        }
      }
    } catch (e) {
      if (mounted) {
        showCustomSnacbar(context, message: "error_picking_image".tr());
      }
    }
  }

  ValueNotifier<String> avatarLink = ValueNotifier("");
  ValueNotifier<bool> isAvatarLoading = ValueNotifier(false);

  final logoutBloc = sl<UserBloc>();
  final avatarBloc = sl<UserBloc>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserBloc>().add(UserEvent.getProfile());
      },
      child: Stack(
        children: [
          Image.asset(Assets.assetsImagesProfile),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state.map(
                initial: (value) => const SizedBox.shrink(),
                loading: (value) => const _ProfileLoadingSkeleton(),
                changedPassword: (value) => const SizedBox.shrink(),
                gotProfile: (profile) {
                  avatarLink.value = profile.profile.avatar;
                  return SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70),
                        _profileAvatar(),
                        SizedBox(height: AppConstants.defaultPadding),
                        Text(
                          profile.profile.fullName ?? "",
                          style: AppTextStyles.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: AppConstants.defaultPadding / 2),

                        Text(
                          "@${profile.profile.username}",
                          style: AppTextStyles.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 50),
                        Material(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppConstants.defaultPadding,
                              left: AppConstants.defaultPadding,
                              right: AppConstants.defaultPadding,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: StatCard(
                                        title: 'productivity_stat'.tr(),
                                        value:
                                            '%${profile.profile.productivityScore?.ceil()}',
                                        icon: Assets.assetsIconsProductivity,
                                        iconColor: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppConstants.defaultPadding,
                                    ),
                                    Expanded(
                                      child: StatCard(
                                        title: 'completed_courses'.tr(),
                                        value:
                                            '${profile.profile.completedCourses}',
                                        icon: Assets.assetsIconsMyCourses,
                                        iconColor: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppConstants.defaultPadding,
                                    ),
                                    Expanded(
                                      child: StatCard(
                                        title: 'finished_tasks'.tr(),
                                        value:
                                            '${profile.profile.totalTasksCompleted}',
                                        icon: Assets.assetsIconsCompletedTasks,
                                        iconColor: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                ProfileMenuItem(
                                  icon: Assets.assetsIconsEditProfile,
                                  text: 'edit_data'.tr(),
                                  onTap: () {
                                    context.push(
                                      AppRoutes.editProfile,
                                      extra: profile.profile,
                                    );
                                  },
                                ),
                                ProfileMenuItem(
                                  icon: Assets.assetsIconsMyCourses,
                                  text: 'my_courses'.tr(),
                                  onTap: () {
                                    context.push(AppRoutes.myCourses);
                                  },
                                ),
                                ProfileMenuItem(
                                  icon: Assets.assetsIconsLanguage,
                                  text: 'language'.tr(),
                                  trailing: ValueListenableBuilder(
                                    valueListenable: languageName,
                                    builder: (context, value, child) {
                                      return Text(
                                        languageName.value,
                                        style: AppTextStyles.bodyMedium,
                                      );
                                    },
                                  ),
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder:
                                          (context) => LanguageBottomSheet(),
                                    );
                                    if (mounted) {
                                      languageName.value =
                                          _getCurrentLanguageName(context);
                                    }
                                  },
                                ),
                                ProfileMenuItem(
                                  icon: Assets.assetsIconsSupport,
                                  text: 'contact_us'.tr(),
                                  onTap: () async {
                                    await launchUrl(
                                      Uri.parse(
                                        'https://redcrescent.uz/uz/contacts/',
                                      ),
                                    );
                                  },
                                ),
                                ProfileMenuItem(
                                  icon: Assets.assetsIconsInstructions,
                                  text: 'user_manual'.tr(),
                                  onTap: () {
                                    context.push(AppRoutes.faq);
                                  },
                                ),
                                BlocListener<UserBloc, UserState>(
                                  bloc: logoutBloc,
                                  listener: (context, state) {
                                    print(state);
                                    state.maybeMap(
                                      orElse: () {},
                                      logout: (value) {
                                        context.go(AppRoutes.login);
                                      },
                                    );
                                  },
                                  child: ProfileMenuItem(
                                    icon: Assets.assetsIconsLogout,
                                    text: 'logout'.tr(),
                                    onTap: onLogoutTap,
                                    isLast: false,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                BlocListener<UserBloc, UserState>(
                                  bloc: logoutBloc,
                                  listener: (context, state) {
                                    state.maybeMap(
                                      orElse: () {},
                                      deletedAccount: (_) {
                                        context.go(AppRoutes.splash);
                                      },
                                      error: (e) {
                                        showCustomSnacbar(
                                          context,
                                          message: e.failure.message,
                                        );
                                      },
                                    );
                                  },
                                  child: ProfileMenuItem(
                                    icon: Assets.assetsIconsExit,
                                    text: 'delete_account'.tr(),
                                    onTap: onDeleteAccountTap,
                                    isLast: true,
                                  ),
                                ),

                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                logout: (value) => const SizedBox.shrink(),
                updatedProfile: (value) => const SizedBox.shrink(),
                error: (value) {
                  if (value.failure is NetworkFailure) {
                    return NoInternetWidget(
                      onRetry: () {
                        context.read<UserBloc>().add(UserEvent.getProfile());
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(value.failure.message),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              context.read<UserBloc>().add(
                                UserEvent.getProfile(),
                              );
                            },
                            child: Text('retry'.tr()),
                          ),
                        ],
                      ),
                    );
                  }
                },
                changedAvatar: (value) => const SizedBox.shrink(),
                deletedAccount: (value) => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _profileAvatar() {
    return SizedBox(
      height: 100,
      width: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 19.5,
                    spreadRadius: 0,
                    color: Colors.black.withValues(alpha: .06),
                  ),
                ],
              ),
              child: ValueListenableBuilder(
                valueListenable: avatarLink,
                builder: (context, value, child) {
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(value),
                    child: ValueListenableBuilder(
                      valueListenable: isAvatarLoading,
                      builder: (context, value, child) {
                        return value
                            ? CustomLoading(color: AppColors.primaryColor)
                            : SizedBox.shrink();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          BlocListener<UserBloc, UserState>(
            bloc: avatarBloc,
            listener: (context, state) {
              state.maybeMap(
                orElse: () {
                  isAvatarLoading.value = false;
                },
                loading: (value) {
                  isAvatarLoading.value = true;
                },
                changedAvatar: (value) {
                  avatarLink.value = value.avatarLink;
                  isAvatarLoading.value = false;
                  showCustomSnacbar(
                    context,
                    message: "avatar_changed".tr(),
                    type: SnacbarType.success,
                  );
                },
                error: (value) {
                  isAvatarLoading.value = false;
                  showCustomSnacbar(context, message: value.failure.message);
                },
              );
            },
            child: Positioned(
              right: 5,
              top: 0,
              bottom: 0,
              child: Center(
                child: InkWell(
                  onTap: () {
                    _pickAndUploadAvatar();
                  },
                  child: Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentLanguageName(BuildContext context) {
    final currentLocale = context.locale;
    String? newLocale;
    supportedLanguagesMap.forEach((key, value) {
      if (value == currentLocale) newLocale = key;
    });
    if (newLocale != null) return newLocale!;
    return 'Русский'; // Default
  }

  void onLogoutTap() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoAlertDialog(
          title: Text('logout'.tr()),
          content: Text('are_you_sure_you_want_to_logout'.tr()),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('cancel'.tr()),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('agree'.tr()),
              onPressed: () async {
                Navigator.of(ctx).pop();
                logoutBloc.add(const UserEvent.logout());
                await sl<LocalStorage>().clearUser();
                if (mounted) {
                  context.go(AppRoutes.splash);
                }
                // Assuming the BLoC listener will handle navigation
                // after the state changes to logout.
              },
            ),
          ],
        );
      },
    );
  }

  void onDeleteAccountTap() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoAlertDialog(
          title: Text('delete_account'.tr()),
          content: Text('are_you_sure_you_want_to_delete_account'.tr()),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('cancel'.tr()),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('agree'.tr()),
              onPressed: () async {
                Navigator.of(ctx).pop();
                logoutBloc.add(const UserEvent.deleteAccount());
              },
            ),
          ],
        );
      },
    );
  }
}

// Loading shimmer skeleton
class _ProfileLoadingSkeleton extends StatelessWidget {
  const _ProfileLoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    final pad = AppConstants.defaultPadding;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 70),
          // Avatar + add button
          SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              alignment: Alignment.center,
              children: const [
                CustomShimmer(height: 100, width: 100, isCircle: true),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: CustomShimmer(height: 32, width: 32, isCircle: true),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const CustomShimmer(height: 20, width: 160),
          const SizedBox(height: 8),
          const CustomShimmer(height: 16, width: 110),
          const SizedBox(height: 40),
          // White panel mimic
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            ),
            padding: EdgeInsets.only(
              top: pad,
              left: pad,
              right: pad,
              bottom: pad,
            ),
            child: Column(
              children: [
                // Stats row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: const [
                          CustomShimmer(
                            height: 70,
                            width: double.infinity,
                            borderRadius: 14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppConstants.defaultPadding),
                    Expanded(
                      child: Column(
                        children: const [
                          CustomShimmer(
                            height: 70,
                            width: double.infinity,
                            borderRadius: 14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppConstants.defaultPadding),
                    Expanded(
                      child: Column(
                        children: const [
                          CustomShimmer(
                            height: 70,
                            width: double.infinity,
                            borderRadius: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                // Menu items placeholders
                ...List.generate(
                  6,
                  (i) => Padding(
                    padding: EdgeInsets.only(bottom: i == 5 ? 0 : 14),
                    child: Row(
                      children: [
                        const CustomShimmer(
                          height: 40,
                          width: 40,
                          borderRadius: 12,
                        ),
                        const SizedBox(width: 16),
                        CustomShimmer(
                          height: 16,
                          width: width * 0.5 + (i.isEven ? 40 : 0),
                          borderRadius: 8,
                        ),
                        const Spacer(),
                        const CustomShimmer(
                          height: 16,
                          width: 20,
                          borderRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
