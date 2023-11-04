import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';

class GraphCustomPaint extends CustomPainter {
  CryptoHistoryPriceListModel model;
  List<double> percentageData = [];
  List<double> anotherData = [
    83396.89,
    82364.65,
    81545.52,
    82169.63,
    81390.36,
    81591.06,
    81923.55,
    81500.0,
    81050.0,
    81257.9,
    81385.01,
    82028.57,
    81845.01,
    82040.0,
    82267.56,
    82249.01,
    81891.57,
    81969.37,
    81780.0,
    81990.01,
    81529.27,
    80799.75,
    82615.06,
    82540.25
  ];
  double maxPrice = 0;
  GraphCustomPaint(this.model) {
    settingsModel();
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = paintConfigure();
    var path = drawFunction(canvas, size);

    paint.shader = paint.shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        colors: [Colors.red.shade400, Colors.blue.withAlpha(100)],
        stops: const [0.0, 1.0]).createShader(path.getBounds());
    canvas.drawPath(path, paint);
  }

  Path drawFunction(Canvas canvas, Size size) {
    var path = Path();
    final limitSize = Size(size.width - 5.0, size.height);
    final stepWidth = limitSize.width / anotherData.length;
    double nextStepX = 5.0;
    path.moveTo(5.0, limitSize.height);
    bool flagFirst = true;
    for (var element in percentageData) {
      if (flagFirst) {
        flagFirst = false;
        if (maxPrice == element) {
          path.lineTo(5.0, (((element) * limitSize.height)).abs());
        } else {
          path.lineTo(5.0, (((element) * limitSize.height)).abs());
        }
      } else {
        if (maxPrice == element) {
          path.lineTo(5.0, (((element) * limitSize.height)).abs());
        } else {
          nextStepX += stepWidth;
          path.lineTo(nextStepX, (((element) * limitSize.height)).abs());
        }
      }
    }
    path.lineTo(limitSize.width, limitSize.height);
    return path;
  }

  Paint paintConfigure() {
    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 1.5;
    paint.style = PaintingStyle.fill;
    // paint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 1.0);
    return paint;
  }

  void settingsModel() {
    maxPrice = anotherData
        .reduce((value, element) => value > element ? value : element);
    percentageData = anotherData.map((e) {
      if (1.0 - ((maxPrice - e) / e * 25) > 1.0) {
        return (((maxPrice - e) / e * 10)).abs();
      } else {
        return (((maxPrice - e) / e * 25)).abs();
      }
    }).toList();
    print(percentageData);
    print('max value  === ${maxPrice}');
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
