import 'dart:math';
import 'package:flutter/material.dart';

class WalletPortfolioCircularGraph extends CustomPainter {
  List<int> percents = [];
  List<Color> colors = [];
  double animationProgress;
  Path path = Path();
  WalletPortfolioCircularGraph(
      this.percents, this.colors, this.animationProgress);

  @override
  void paint(Canvas canvas, Size size) {
    drawAllPercents(canvas, size);
  }

  void drawAllPercents(Canvas canvas, Size size) {
    int maxValue = percents.reduce(
      (value, element) {
        return value > element ? value : element;
      },
    );
    for (int i = 0; i < percents.length; i++) {
      Paint paint = Paint();
      paint.color = colors[i];
      paint.strokeCap = StrokeCap.round;
      paint.strokeJoin = StrokeJoin.round;
      paint.strokeWidth = 20.0;
      paint.style = PaintingStyle.stroke;
      paint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 5);

      Path localPath = Path();
      localPath.addArc(
          Rect.fromCenter(
              center: Offset(size.width / 2.0, size.height / 2.0),
              width: size.width,
              height: size.height),
          -pi / 2,
          ((pi * 2) * (percents[i] / maxValue)) * animationProgress);

      canvas.drawPath(localPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
