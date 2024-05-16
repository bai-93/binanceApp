import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class PositiveMarkDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColorsUtility.surface
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    Path path = Path();

    double leftSideX = 0.465 * size.width;
    double leftSideY = 0.45 * size.height;
    path.moveTo(leftSideX, leftSideY);
    path.lineTo(size.width * 0.48, size.height * 0.57);

    double rightSideX = 0.51 * size.width;
    double rightSideY = 0.36 * size.height;
    path.lineTo(rightSideX, rightSideY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
