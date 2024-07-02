import 'dart:math';
import 'package:flutter/material.dart';

class WalletPortfolioCircularGraph extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.green;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 20.0;
    paint.style = PaintingStyle.stroke;
    paint.maskFilter = const MaskFilter.blur(BlurStyle.solid, 15);

    Path path = Path();
    path.addArc(
        Rect.fromCenter(
            center: Offset(size.width / 2.0, size.height / 2.0),
            width: size.width,
            height: size.height),
        -pi / 2,
        (pi * 2) * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
