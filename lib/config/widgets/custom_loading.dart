import 'package:app/config/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    this.color = AppColors.white,
    this.radius = 20.0,
  });

  final Color color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: radius,
        width: radius,
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
