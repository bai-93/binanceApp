import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';

class GraphCustomPaint extends CustomPainter {
  CryptoHistoryPriceListModel model;
  List<double> percentageData = [];
  List<Offset> coordinates = [];
  List<double> anotherData = [
    2,
    10,
    11,
    15,
    13,
    2,
    20,
    15,
    7,
    10,
    18,
    9,
    5,
  ];
  GraphCustomPaint(this.model) {
    settingsModel();
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = paintConfigure();

    var path = drawFunction(canvas, size);
    paint.shader = LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0, 1.0],
            colors: [Colors.red, Colors.blue, Colors.blue.withAlpha(127)])
        .createShader(path.getBounds());
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
      if (isFirst) {
        isFirst = false;
        path.moveTo(0.0, (percentageData[i]) * (limitSize.height));

        path.cubicTo(
            nextStepX + stepWidth / 2,
            (((percentageData[i]) * limitSize.height)),
            nextStepX + stepWidth / 2,
            ((percentageData[i + 1]) * limitSize.height),
            nextStepX + stepWidth,
            ((percentageData[i + 1]) * limitSize.height));
      } else {
        if (nextIndex + 1 < percentageData.length) {
          path.cubicTo(
              nextStepX + stepWidth / 2,
              (((percentageData[i]) * limitSize.height)),
              nextStepX + stepWidth / 2,
              (percentageData[i + 1]) * limitSize.height,
              nextStepX + stepWidth,
              ((percentageData[i + 1]) * limitSize.height));
        } else {
          double temp = percentageData[i] < percentageData[i - 1] ? 50.0 : 25.0;
          double controlPoint =
              percentageData[i] < percentageData[i - 1] ? -5.0 : 5.0;
          path.cubicTo(
              nextStepX + stepWidth / 2,
              (((percentageData[i]) * limitSize.height + (controlPoint))),
              nextStepX + stepWidth / 2,
              (percentageData[i]) * limitSize.height + (controlPoint),
              nextStepX + stepWidth,
              ((percentageData[i]) * limitSize.height + (temp)));
        }
      }
      nextStepX += stepWidth;
      nextIndex++;
    }
    path.lineTo(limitSize.width, limitSize.height);
    path.lineTo(0.0, limitSize.height);
    path.close();
    return path;
  }

// it will work but we have to consider more cases for example if value is zero then we get NAN
  double getCoefficient(int index, double limitHeight) {
    double coeff = (log(percentageData[index]).abs()) * 10 > 1.0
        ? ((log(percentageData[index]).abs()) / 20)
        : ((log(percentageData[index]).abs()) * 10);
    return (limitHeight - (coeff * limitHeight * 1.7)).abs();
  }

  Paint paintConfigure() {
    var paint = Paint();
    paint.color = Colors.red;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 4;
    paint.style = PaintingStyle.fill;
    // paint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 1.0);
    return paint;
  }

  void settingsModel() {
    double majorMaxPrice = anotherData
        .reduce((value, element) => value > element ? value : element);
    int majorMaxIndex = anotherData.indexOf(majorMaxPrice);
    anotherData[majorMaxIndex] = 0.0;
    double minorMaxPrice = anotherData
        .reduce((value, element) => value > element ? value : element);
    int minorMaxIndex = anotherData.indexOf(minorMaxPrice);
    anotherData[majorMaxIndex] = majorMaxPrice;
    List<double> subtractedData =
        anotherData.map((e) => majorMaxPrice - e).toList();
    double maxValueFromSubtracted = subtractedData
        .reduce((value, element) => value > element ? value : element);
    int index = 0;
    percentageData = subtractedData.map((e) {
      if (e == 0.0) {
        index += 1;
        return 0.0;
      }
      if (index == minorMaxIndex) {
        print("yes");
        index++;
        return 1 - (minorMaxPrice / majorMaxPrice);
      } else if (e == maxValueFromSubtracted) {
        print(
            "index == ${index} subtracted Max value  == ${maxValueFromSubtracted}");
        index++;
        return e / majorMaxPrice;
      } else {
        index++;
        return e / maxValueFromSubtracted;
      }
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
