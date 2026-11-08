import 'dart:async';

import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/custom_text_field.dart';
import 'package:app/config/widgets/image_widget.dart' show SvgWidget;
import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  const HeaderWidget({
    super.key,
    required this.currentIndex,
    required this.onSearchPressed,
  });

  final int currentIndex;
  final Function(String query)? onSearchPressed;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(currentIndex == 2 ? 55 : 70);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  getName() {
    switch (widget.currentIndex) {
      case 1:
        return "courses".tr();
      case 2:
        return "rating".tr();
      default:
        return "Unknown";
    }
  }

  bool _isSearching = false;

  final _searchController = TextEditingController();

  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Call the callback passed from the parent widget
      widget.onSearchPressed!(query);
    });
  }

  Widget _buildSearchAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: null,
      automaticallyImplyLeading: false,
      title: CustomTextField(
        controller: _searchController,
        autofocus: true,
        hintText: 'search'.tr(),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchController.clear();
                });
                // Trigger a search with an empty query to show all results again
                widget.onSearchPressed!('');
              },
            ),
          ],
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }

  String? profileName;
  String? profileAvatar;
  @override
  Widget build(BuildContext context) {
    if (_isSearching) {
      return _buildSearchAppBar(context);
    }

    if (widget.currentIndex == 3) {
      return SizedBox.shrink();
    }

    if (widget.currentIndex == 2 || widget.currentIndex == 1) {
      return AppBar(
        backgroundColor: Colors.white,
        title: Text(getName(), style: AppTextStyles.titleMedium),
        actions: [
          if (widget.currentIndex == 1)
            IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
              icon: SvgWidget(icon: Assets.assetsIconsSearch),
            ),
          SizedBox(width: AppConstants.defaultPadding - 6),
        ],
      );
    }

    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.map(
          initial: (value) {},
          loading: (value) {},
          changedPassword: (value) {},
          gotProfile: (value) {
            profileName = value.profile.fullName;
            profileAvatar = value.profile.avatar;
          },
          logout: (value) {},
          updatedProfile: (value) {},
          error: (value) {},
          changedAvatar: (value) {
            profileAvatar = value.avatarLink;
          },
          deletedAccount: (value) {},
        );
      },
      builder: (context, state) {
        return AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: AppConstants.defaultPadding),
            child:
                (state.whenOrNull(loading: () => false) ?? true)
                    ? CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        profileAvatar ?? "",
                      ),
                    )
                    : CustomShimmer(isCircle: true),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.whenOrNull(loading: () => true) ?? false) ...[
                CustomShimmer(height: 20, width: 50),
                const SizedBox(height: 5),
                CustomShimmer(height: 20, width: 50),
              ] else ...[
                Text('hello'.tr(), style: AppTextStyles.caption),
                Text(profileName ?? "User", style: AppTextStyles.titleMedium),
              ],
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.push(AppRoutes.feedback);
              },
              icon: SvgWidget(icon: Assets.assetsIconsComment),
            ),
            IconButton(
              onPressed: () {
                context.push(AppRoutes.notifications);
              },
              icon: SvgWidget(icon: Assets.assetsIconsBell),
            ),
            SizedBox(width: AppConstants.defaultPadding - 6),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(14),
            child: ColoredBox(color: Colors.white),
          ),
        );
      },
    );
  }
}
