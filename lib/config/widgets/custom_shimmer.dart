import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;
  final bool isCircle;

  const CustomShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.margin,
    this.baseColor,
    this.highlightColor,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final effectiveBaseColor =
        baseColor ?? (isDarkMode ? Colors.grey[800]! : Colors.grey[300]!);
    final effectiveHighlightColor =
        highlightColor ?? (isDarkMode ? Colors.grey[700]! : Colors.grey[100]!);

    return Shimmer.fromColors(
      baseColor: effectiveBaseColor,
      highlightColor: effectiveHighlightColor,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white, // This color is covered by the shimmer effect.
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
