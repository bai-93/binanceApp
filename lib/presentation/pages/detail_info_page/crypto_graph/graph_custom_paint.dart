import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';

class GraphCustomPaint extends CustomPainter {
  CryptoHistoryPriceListModel model;
  List<double> percentageData = [];
  List<Offset> coordinates = [];
  List<double> anotherData = [
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
    62806.18,
    63806.18,
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
          double temp = percentageData[i] < percentageData[i - 1] ? 0.0 : 0.0;
          double controlPoint =
              percentageData[i] < percentageData[i - 1] ? 0.0 : 0.0;
          path.cubicTo(
              nextStepX - stepWidth,
              (((percentageData[i]) * limitSize.height + (controlPoint))),
              nextStepX + stepWidth,
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
    int startIndex = model.data.length - 15;
    int endIndex = model.data.length;
    // here I had to be shortened here, because we got a huge size of data
    List<CryptoHistoryPriceModel> cryptoHistoryModel =
        model.data.getRange(startIndex, endIndex).toList();
    anotherData =
        cryptoHistoryModel.map((e) => double.parse(e.priceUsd)).toList();
    double majorMaxPrice = anotherData
        .reduce((value, element) => value > element ? value : element);
    List<double> subtractedData =
        anotherData.map((e) => majorMaxPrice - e).toList();
    double maxValueFromSubtracted = subtractedData
        .reduce((value, element) => value > element ? value : element);
    percentageData = subtractedData.map((e) {
      if (e == 0.0) {
        return 0.0;
      } else if (e == maxValueFromSubtracted) {
        return 0.9;
      } else {
        return (e / maxValueFromSubtracted - 0.1).abs();
      }
    }).toList();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
