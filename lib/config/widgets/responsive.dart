import 'package:app/config/app_colors.dart';
import 'package:flutter/material.dart';

/// Helpers for the desktop (web) layout.
class Responsive {
  Responsive._();

  static const double desktopBreakpoint = 900;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopBreakpoint;
}

/// Limits the width of [child] and also gives it a matching MediaQuery size,
/// so widgets that size themselves by screen width don't get huge on desktop.
class MaxWidthBox extends StatelessWidget {
  const MaxWidthBox({super.key, required this.maxWidth, required this.child});

  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mq = MediaQuery.of(context);
        final available =
            constraints.maxWidth.isFinite ? constraints.maxWidth : maxWidth;
        final width = available < maxWidth ? available : maxWidth;
        final height =
            constraints.maxHeight.isFinite
                ? constraints.maxHeight
                : mq.size.height;
        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: width,
            height: height,
            child: MediaQuery(
              data: mq.copyWith(size: Size(width, height)),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

/// Wraps a full screen page: on desktop it is shown as a centered card
/// on a light background, on phones nothing changes.
class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key, required this.child, this.maxWidth = 820});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isDesktop(context)) return child;
    return ColoredBox(
      color: const Color(0xFFEEF0F3),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: MaxWidthBox(
          maxWidth: maxWidth,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
