import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class LineAnimation extends CustomPainter {
  final double animationValue;

  LineAnimation(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.onboardingPrimary
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    Offset from = Offset(0.0, size.height / 2.0);
    Offset to = Offset(size.width * animationValue, size.height / 2.0);

    canvas.drawLine(from, to, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
