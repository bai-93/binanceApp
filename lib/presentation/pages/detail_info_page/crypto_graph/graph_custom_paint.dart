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
    canvas.drawPath(path, paint);
  }

  Path drawFunction(Canvas canvas, Size size) {
    var path = Path();
    final limitSize = Size(size.width, size.height);
    final stepWidth = limitSize.width / percentageData.length;
    double nextStepX = stepWidth / 2;
    bool isFirst = true;
    int nextIndex = 0;
    for (var i = 0; i < percentageData.length; i++) {
      double uniCoefficient = 0.0;
      double paddingTop = limitSize.height * 1 / 15;
      double coef = (log(percentageData[i]).abs()) * 15 > 1.0
          ? (log(percentageData[i]).abs()) / 10
          : (log(percentageData[i]).abs()) * 12;
      uniCoefficient =
          (limitSize.height - (coef * limitSize.height * 1.7)).abs();
      print('coeff === ${coef} and uni === ${uniCoefficient}');
      if (isFirst) {
        isFirst = false;
        path.moveTo(
            nextStepX,
            (((percentageData[i]) * limitSize.height - uniCoefficient)).abs() +
                paddingTop);
        path.lineTo(
            nextStepX,
            (((percentageData[i]) * limitSize.height - uniCoefficient)).abs() +
                paddingTop);
      } else {
        if (nextIndex < percentageData.length) {}
        path.lineTo(
            nextStepX,
            (((percentageData[i]) * limitSize.height - uniCoefficient)).abs() +
                paddingTop);
      }
      nextStepX += stepWidth;
      nextIndex++;
    }
    return path;
  }

  Paint paintConfigure() {
    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 2.5;
    paint.style = PaintingStyle.stroke;
    // paint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 1.0);
    return paint;
  }

  void settingsModel() {
    maxPrice = anotherData
        .reduce((value, element) => value > element ? value : element);
    percentageData = anotherData.map((e) {
      return (e / maxPrice);
    }).toList();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

final data = [
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

final data2 = [1550.0, 1000, 1200, 1300, 1400];
final data3 = [10, 11, 15, 13, 5, 20, 16, 2, 7, 18, 9, 5, 3];
final data4 = [
  62634.79,
  63027.62,
  63231.06,
  63174.99,
  63000.0,
  63084.5,
  62575.85,
  62799.99,
  63239.31,
  62834.99,
  63006.5,
  63094.97,
  62740.13,
  62734.97,
  63460.04,
  62773.37,
  63195.48,
  62653.63,
  62384.96,
  62743.44,
  63014.9,
  63188.83,
  62979.91,
  62806.18
];