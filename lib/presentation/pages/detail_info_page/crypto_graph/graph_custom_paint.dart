import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sheker/config/theme/theme_manager.dart';
import 'dart:ui' as UI;
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/biometryhelper.dart';
import 'package:sheker/utilities/graph_data_normalize.dart';
import 'package:sheker/utilities/money_formatter.dart';

class GraphCustomPaint extends CustomPainter {
  CryptoHistoryPriceListModel? model;
  Offset positionOfTouch = Offset.zero;
  Path graphPath = Path();
  Path gradientPath = Path();
  void Function(double value, String date) callBack;

  List<double> cryptoMoneyData = [
    65000.0,
    65300.0,
    65350.0,
    65200.0,
    65250.0,
    65310.0,
    65290.0,
    65280.0,
    65290.0
  ];
  List<double> percentCoefficientData = [];
  int indexMin = 0, indexMax = 0;
  List<Offset> coordinates = [];

  GraphCustomPaint(this.model, this.callBack,
      {this.positionOfTouch = Offset.zero}) {
    settingsModel();
  }

  @override
  void paint(Canvas canvas, Size size) {
    graphPath = drawFunction(canvas, size);
    gradientPath = drawFunction(canvas, size);

    Paint paint = graphPaintArea(graphPath.getBounds(), isStroke: true);
    Paint gradientPaint = graphPaintArea(gradientPath.getBounds());
    canvas.drawPath(graphPath, paint);
    gradientPath.lineTo(size.width, size.height);
    gradientPath.close();
    canvas.drawPath(gradientPath, gradientPaint);
    minMaxCircleDraw(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void settingsModel() {
    double maxValue = cryptoMoneyData.reduce(
      (value, element) {
        return value > element ? value : element;
      },
    );
    List<double> subtractedData = cryptoMoneyData.map(
      (e) {
        return maxValue - e;
      },
    ).toList();
    double subtractedMax = subtractedData.reduce(
      (value, element) {
        return value > element ? value : element;
      },
    );
    subtractedData = subtractedData.map(
      (e) {
        if (e == 0.0) {
          return subtractedMax * 1 / 9;
        } else {
          return subtractedMax * 1 / 9 + e;
        }
      },
    ).toList();
    double max = subtractedData.reduce(
      (value, element) {
        return value > element ? value : element;
      },
    );
    double min = subtractedData.reduce(
      (value, element) {
        return value > element ? element : value;
      },
    );
    indexMin = subtractedData.indexOf(min);
    indexMax = subtractedData.indexOf(max);

    percentCoefficientData = subtractedData.map(
      (e) {
        return e / max;
      },
    ).toList();
  }

  Path drawFunction(Canvas canvas, Size size) {
    var path = Path();
    final double stepWidth = size.width / cryptoMoneyData.length;
    double halfStep = stepWidth / 2;
    double nextStepX = stepWidth;
    final height = size.height;
    bool isFirst = true;
    coordinates.clear();
    for (int i = 0; i < percentCoefficientData.length; i++) {
      if (isFirst) {
        isFirst = false;
        path.moveTo(0.0, percentCoefficientData[i] * height);
        coordinates.add(Offset(0.0, percentCoefficientData[i] * height));
        path.cubicTo(
            halfStep * 2.0,
            percentCoefficientData[i] * height,
            halfStep * 2.0,
            percentCoefficientData[i + 1] * height,
            nextStepX + halfStep,
            percentCoefficientData[i + 1] * height);
        coordinates.add(Offset(
            nextStepX + halfStep, percentCoefficientData[i + 1] * height));
      } else {
        if (i + 1 < percentCoefficientData.length) {
          path.cubicTo(
              nextStepX + stepWidth,
              percentCoefficientData[i] * height,
              nextStepX + stepWidth,
              percentCoefficientData[i + 1] * height,
              nextStepX + stepWidth + halfStep,
              percentCoefficientData[i + 1] * height);
          coordinates.add(Offset(nextStepX + stepWidth + halfStep,
              percentCoefficientData[i + 1] * height));
        } else {
          if (percentCoefficientData[i] > percentCoefficientData[i - 1]) {
            path.cubicTo(
                size.width * 0.99,
                percentCoefficientData[i] * height,
                size.width * 0.99,
                percentCoefficientData[i] * height,
                size.width,
                percentCoefficientData[i] * height);
          } else {
            path.cubicTo(
                size.width * 0.99,
                percentCoefficientData[i - 1] * height,
                size.width * 0.99,
                percentCoefficientData[i - 1] * height,
                size.width,
                percentCoefficientData[i - 1] * height);
          }
        }
        nextStepX += stepWidth;
      }
    }
    // path.lineTo(size.width, size.height);
    // path.close();
    return path;
  }

  //graph's Paint
  Paint graphPaintArea(Rect boundsPath, {bool isStroke = false}) {
    bool flag = getIt<ThemeManager>().getIsDark() ?? false;
    Paint paint = Paint();
    paint.color = flag
        ? AppColorsUtility.onboardingPrimary
        : AppColorsUtility.darkPrimary;
    paint.strokeWidth = isStroke ? 3.0 : 0.0;
    paint.style = isStroke ? PaintingStyle.stroke : PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.shader = isStroke ? null : graphGradient(boundsPath, flag);
    return paint;
  }

  Shader graphGradient(Rect rectBounds, bool isDarkTheme) {
    LinearGradient linearGradient = LinearGradient(
        colors: AppColorsUtility.graphGradientColor(isDarkTheme),
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    return linearGradient.createShader(rectBounds);
  }

// here we'll add circle shape for minimal and maximum values
  void minMaxCircleDraw(Canvas canvas, Size size) {
    bool isDarkTheme = getIt<ThemeManager>().getIsDark() ?? false;
    double maxValues = percentCoefficientData
        .reduce((value, element) => value > element ? value : element);
    double minValues = percentCoefficientData
        .reduce((value, element) => value > element ? element : value);
    int indexMaxValues = percentCoefficientData.indexOf(maxValues);
    int indexMinValues = percentCoefficientData.indexOf(minValues);

    // min value
    canvas.drawCircle(
        coordinates[indexMaxValues],
        9.0,
        cirlclePaint(
            color: isDarkTheme
                ? AppColorsUtility.onboardingPrimary
                : AppColorsUtility.darkPrimary));
    canvas.drawCircle(
        Offset(coordinates[indexMaxValues].dx, coordinates[indexMaxValues].dy),
        4.0,
        cirlclePaint(color: isDarkTheme ? Colors.black : Colors.white));

    // max values
    canvas.drawCircle(
        coordinates[indexMinValues],
        9.0,
        cirlclePaint(
            color: isDarkTheme
                ? AppColorsUtility.onboardingPrimary
                : AppColorsUtility.darkPrimary));
    canvas.drawCircle(coordinates[indexMinValues], 4.0,
        cirlclePaint(color: isDarkTheme ? Colors.black : Colors.white));
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
    double minValue = percentCoefficientData[indexMinValue];
    double maxValue = percentCoefficientData[indexMaxValue];
    Offset minOffset = coordinates[indexMinValue];
    Offset maxOffset = coordinates[indexMaxValue];

    TextPainter minPainter =
        textPainter(MoneyFormatterUtility.dollarFormat(minValue.toString()));
    TextPainter maxPainter =
        textPainter(MoneyFormatterUtility.dollarFormat(maxValue.toString()));

    minPainter.paint(canvas, Offset(minOffset.dx, minOffset.dy));
    maxPainter.paint(canvas, Offset(maxOffset.dx, maxOffset.dy));
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

  // it will work but we have to consider more cases for example if value is zero then we get NAN
  // double getCoefficient(int index, double limitHeight) {
  //   double coeff = (log(percentageData[index]).abs()) * 10 > 1.0
  //       ? ((log(percentageData[index]).abs()) / 20)
  //       : ((log(percentageData[index]).abs()) * 10);
  //   return (limitHeight - (coeff * limitHeight * 1.7)).abs();
  // }

  //Here we added scale indicator
  // void drawRulerScaleOfIndicator(Canvas canvas, Size size) {
  //   Paint paint = Paint()
  //     ..color = Colors.black
  //     ..strokeCap = StrokeCap.round
  //     ..strokeJoin = StrokeJoin.round
  //     ..strokeWidth = 1.5
  //     ..style = PaintingStyle.stroke;
  //   double lineStep = size.height / 10.0;
  //   double stepSumm = 0.0;
  //   bool isFirst = true;

  //   Path bezierPath = Path();
  //   double percentOfWidth = positionOfTouch.dx / size.width;
  //   int index = (percentOfWidth * (coordinates.length - 1)).toInt();
  //   bezierPath.moveTo(coordinates[index].dx, 0.0);
  //   for (var i = 0; i < 10; i++) {
  //     bezierPath.lineTo(coordinates[index].dx, isFirst ? 10.0 : stepSumm);
  //     stepSumm += lineStep;
  //     bezierPath.moveTo(coordinates[index].dx, stepSumm + 10);
  //     isFirst = false;
  //   }
  //   canvas.drawPath(bezierPath, paint);
  //   drawCircleRulerIndicator(canvas, size);
  //   callBack(percentCoefficient[index], dates[index]);
  // }

  // void drawCircleRulerIndicator(Canvas canvas, Size size) {
  //   double percentOfWidth = positionOfTouch.dx / size.width;
  //   int index = (percentOfWidth * (coordinates.length - 1)).toInt();
  //   Paint paint = Paint()
  //     ..color = Colors.cyan.shade500
  //     ..style = PaintingStyle.stroke
  //     ..strokeWidth = 3.0;
  //   Path bezierPath = Path();
  //   bezierPath.addArc(
  //       Offset(coordinates[index].dx - 5.0, coordinates[index].dy - 5) &
  //           const Size(10.0, 10.0),
  //       0.0,
  //       pi * 2);
  //   canvas.drawPath(bezierPath, paint);
  // }
}
