import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double percent;

  CircleProgressPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 6.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint =
        Paint()
          ..strokeWidth = strokeWidth
          ..color = Colors.grey.shade300
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final foregroundPaint =
        Paint()
          ..strokeWidth = strokeWidth
          ..color = Colors.red
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    // Draw background circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi,
      false,
      backgroundPaint,
    );

    // Draw foreground progress arc
    double sweepAngle = 2 * pi * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // start at top
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
