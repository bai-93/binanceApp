import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as UI;
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';

class GraphCustomPaint extends CustomPainter {
  CryptoHistoryPriceListModel model;
  double progressValue;
  bool onStartFlag = false, onUpdateFlag = false, onEndFlag = false;
  Offset positionOfTouch = Offset.zero;
  void Function(double value) callBack;

  List<double> percentageData = [];
  List<Offset> coordinates = [];
  List<String> dates = [];
  List<double> percentCoefficient = [
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
  GraphCustomPaint(this.model, this.progressValue, this.callBack,
      {this.onStartFlag = false,
      this.onUpdateFlag = false,
      this.onEndFlag = false,
      this.positionOfTouch = Offset.zero}) {
    settingsModel();
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = paintConfigure(true);
    var path = drawFunction(canvas, size, true);

    paint.shader = LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0, 1.0],
            colors: [Colors.red, Colors.blue, Colors.blue.withAlpha(127)])
        .createShader(path.getBounds());
    canvas.drawPath(path, paint);
    canvas.drawPath(drawFunction(canvas, size, false), paintConfigure(false));
    minMaxCircleDraw(canvas, size);
    drawRulerScaleOfIndicator(canvas, size);
  }

  Path drawFunction(Canvas canvas, Size size, bool isFull) {
    var path = Path();
    final limitSize = Size(size.width, size.height);
    final stepWidth = limitSize.width / percentageData.length;
    double nextStepX = stepWidth / 2;
    bool isFirst = true;
    int nextIndex = 0;
    coordinates.clear();
    for (var i = 0; i < percentageData.length; i++) {
      if (isFirst) {
        isFirst = false;
        path.moveTo(
            0.0, (percentageData[i]) * (limitSize.height * progressValue));
        coordinates.add(Offset(2.0, percentageData[i] * limitSize.height));

        path.cubicTo(
            nextStepX + stepWidth / 2,
            (((percentageData[i]) * limitSize.height * progressValue)),
            nextStepX + stepWidth / 2,
            ((percentageData[i + 1]) * limitSize.height * progressValue),
            nextStepX + stepWidth,
            ((percentageData[i + 1]) * limitSize.height * progressValue));
        coordinates.add(Offset(nextStepX + stepWidth,
            percentageData[i + 1] * limitSize.height * progressValue));
      } else {
        if (nextIndex + 1 < percentageData.length) {
          path.cubicTo(
              nextStepX + stepWidth / 2,
              (((percentageData[i]) * limitSize.height * progressValue)),
              nextStepX + stepWidth / 2,
              (percentageData[i + 1]) * limitSize.height * progressValue,
              nextStepX + stepWidth,
              ((percentageData[i + 1]) * limitSize.height * progressValue));
          coordinates.add(Offset(nextStepX + stepWidth,
              percentageData[i + 1] * limitSize.height * progressValue));
        } else {
          path.cubicTo(
              nextStepX + stepWidth,
              (((percentageData[i]) * limitSize.height * progressValue)),
              nextStepX + stepWidth,
              (percentageData[i]) * limitSize.height * progressValue,
              nextStepX + stepWidth,
              ((percentageData[i]) * limitSize.height * progressValue));
        }
      }
      nextStepX += stepWidth;
      nextIndex++;
    }
    if (isFull) {
      path.lineTo(limitSize.width, limitSize.height);
      path.lineTo(0.0, limitSize.height);
      path.close();
    }
    return path;
  }

// it will work but we have to consider more cases for example if value is zero then we get NAN
  double getCoefficient(int index, double limitHeight) {
    double coeff = (log(percentageData[index]).abs()) * 10 > 1.0
        ? ((log(percentageData[index]).abs()) / 20)
        : ((log(percentageData[index]).abs()) * 10);
    return (limitHeight - (coeff * limitHeight * 1.7)).abs();
  }

  Paint paintConfigure(bool isFill, {Color color = Colors.transparent}) {
    var paint = Paint();
    paint.color = isFill ? Colors.black : Colors.purple;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeMiterLimit = 100.0;
    paint.strokeWidth = isFill ? 0.0 : 3.0;
    paint.style = isFill ? PaintingStyle.fill : PaintingStyle.stroke;
    // paint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 1.0);
    return paint;
  }

  void settingsModel() {
    int startIndex = model.data.length - 15;
    int endIndex = model.data.length;
    // here I had to be shortened here, because we got a huge size of data
    List<CryptoHistoryPriceModel> cryptoHistoryModel =
        model.data.getRange(startIndex, endIndex).toList();
    percentCoefficient =
        cryptoHistoryModel.map((e) => double.parse(e.priceUsd)).toList();
    double majorMaxPrice = percentCoefficient
        .reduce((value, element) => value > element ? value : element);
    List<double> subtractedData =
        percentCoefficient.map((e) => (majorMaxPrice - e).abs()).toList();
    double maxValueFromSubtracted = subtractedData
        .reduce((value, element) => value > element ? value : element);
    percentageData = subtractedData.map((e) {
      if (e == 0.0) {
        return 0.0;
      } else if (e == maxValueFromSubtracted) {
        return 0.8;
      } else {
        return (e / maxValueFromSubtracted - 0.2).abs();
      }
    }).toList();
    dates = cryptoHistoryModel
        .map((e) => DateFormat('dd.mm.yyyy \nHH:mm:ss')
            .format(DateTime.fromMillisecondsSinceEpoch(e.time)))
        .toList();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

// here we'll add circle shape for minimal and maximum values
  void minMaxCircleDraw(Canvas canvas, Size size) {
    double maxValues = percentCoefficient
        .reduce((value, element) => value > element ? value : element);
    double minValues = percentCoefficient
        .reduce((value, element) => value > element ? element : value);
    int indexMaxValues = percentCoefficient.indexOf(maxValues);
    int indexMinValues = percentCoefficient.indexOf(minValues);
    canvas.drawCircle(coordinates[indexMaxValues], 5.0,
        cirlclePaint(color: Colors.tealAccent));
    canvas.drawCircle(
        coordinates[indexMinValues], 5.0, cirlclePaint(color: Colors.red));
    titleOfExtremumPoints(canvas, indexMaxValues, indexMinValues);
  }

  Paint cirlclePaint({Color color = Colors.black}) {
    var paint = Paint();
    paint.color = color;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 1.0;
    paint.style = PaintingStyle.fill;
    return paint;
  }

  //here we added text painter for minimum and maximum values
  void titleOfExtremumPoints(
      Canvas canvas, int indexMaxValue, int indexMinValue) {
    double minValue = percentCoefficient[indexMinValue];
    double maxValue = percentCoefficient[indexMaxValue];
    Offset minOffset = coordinates[indexMinValue];
    Offset maxOffset = coordinates[indexMaxValue];

    TextPainter minPainter = textPainter(minValue.toString());
    TextPainter maxPainter = textPainter(maxValue.toString());

    minPainter.paint(canvas, Offset(minOffset.dx * 0.6, minOffset.dy + 5.0));
    maxPainter.paint(canvas, Offset(maxOffset.dx * 0.6, maxOffset.dy + 5.0));
  }

  TextPainter textPainter(String title) {
    TextPainter painter = TextPainter(
        text: TextSpan(
            text: title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
        textAlign: TextAlign.center,
        textDirection: UI.TextDirection.rtl);
    painter.layout();
    return painter;
  }

  //Here we added scale indicator
  void drawRulerScaleOfIndicator(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    double lineStep = size.height / 10.0;
    double stepSumm = 0.0;
    bool isFirst = true;

    Path bezierPath = Path();
    double percentOfWidth = positionOfTouch.dx / size.width;
    int index = (percentOfWidth * (coordinates.length - 1)).toInt();
    bezierPath.moveTo(coordinates[index].dx, 0.0);
    for (var i = 0; i < 10; i++) {
      bezierPath.lineTo(coordinates[index].dx, isFirst ? 10.0 : stepSumm);
      stepSumm += lineStep;
      bezierPath.moveTo(coordinates[index].dx, stepSumm + 10);
      isFirst = false;
    }
    canvas.drawPath(bezierPath, paint);
    drawCircleRulerIndicator(canvas, size);
  }

  void drawCircleRulerIndicator(Canvas canvas, Size size) {
    double percentOfWidth = positionOfTouch.dx / size.width;
    int index = (percentOfWidth * (coordinates.length - 1)).toInt();
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    Path bezierPath = Path();
    bezierPath.addArc(
        Offset(coordinates[index].dx - 5.0, coordinates[index].dy - 5) &
            const Size(10.0, 10.0),
        0.0,
        pi * 2);
    canvas.drawPath(bezierPath, paint);
  }
}
