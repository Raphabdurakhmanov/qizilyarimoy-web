import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
  });
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius ??
          BorderRadius.circular(AppConstants.defaultBorderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder:
            (context, url, progress) =>
                CustomLoading(color: AppColors.primaryColor),
        errorWidget:
            (context, url, error) =>
                const SvgWidget(icon: Assets.assetsIconsCheck),
        width: width,
        height: height,
        fit: fit,
        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 300),
        fadeInCurve: Curves.easeIn,
      ),
    );
  }
}

class SvgWidget extends StatelessWidget {
  const SvgWidget({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.color,
  });
  final String icon;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width,
      height: height,
      fit: BoxFit.cover,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
