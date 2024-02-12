import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:sheker/utilities/app_colors.dart';

class ArcDraw extends CustomPainter {
  double value;
  ArcDraw(this.value);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.onboardingPrimary.withOpacity(value)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    Rect rect = const Rect.fromLTWH(15.0, 15.0, 18.0, 18.0);
    canvas.drawArc(rect, 6 * pi / 4, 6 * pi / 4, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
