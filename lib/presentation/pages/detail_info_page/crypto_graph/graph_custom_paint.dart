import 'package:flutter/material.dart';
import 'package:sheker/config/theme/theme_manager.dart';
import 'dart:ui' as UI;
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';

class GraphCustomPaint extends CustomPainter {
  CryptoHistoryPriceListModel? model;
  Offset positionOfTouch = Offset.zero;
  Path graphPath = Path();
  Path gradientPath = Path();
  void Function(double value, String date) callBack;

  List<double> cryptoMoneyData = [];
  List<double> percentCoefficientData = [];
  int indexMin = 0, indexMax = 0;
  List<Offset> coordinates = [];

  GraphCustomPaint(this.model, this.callBack,
      {this.positionOfTouch = Offset.zero}) {
    if (model != null) {
      cryptoMoneyData = model!.data.map((item) {
        return double.parse(item.priceUsd);
      }).toList();
    }
    settingsModel();
  }

  @override
  void paint(Canvas canvas, Size size) {
    graphPath = drawFunction(canvas, size);
    gradientPath = graphPath;

    Paint paint = graphPaintArea(graphPath.getBounds(), isStroke: true);
    Paint gradientPaint = graphPaintArea(gradientPath.getBounds());
    canvas.drawPath(graphPath, paint);
    gradientPath.lineTo(size.width, size.height);
    gradientPath.lineTo(0.0, size.height);
    gradientPath.close();
    canvas.drawPath(gradientPath, gradientPaint);
    minMaxCircleDraw(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void settingsModel() {
    if (cryptoMoneyData.length >= 24) {
      cryptoMoneyData = cryptoMoneyData.getRange(0, 24).toList();
    }

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

    indexMin = subtractedData.indexOf(subtractedMax);
    indexMax = cryptoMoneyData.indexOf(maxValue);
    percentCoefficientData = subtractedData.map((e) {
      if (e == 0.0) {
        return 0.1;
      } else if (e == subtractedMax) {
        return 0.9;
      } else {
        return e / subtractedMax;
      }
    }).toList();
  }

  Path drawFunction(Canvas canvas, Size size) {
    var path = Path();
    final double stepWidth = size.width / percentCoefficientData.length;
    double halfStep = stepWidth / 2;
    double nextStepX = stepWidth;
    double height = size.height;
    bool isFirst = true;
    coordinates.clear();

    for (int i = 0; i < percentCoefficientData.length; i++) {
      if (isFirst) {
        isFirst = false;
        path.moveTo(0.0, percentCoefficientData[i] * height);
        coordinates.add(Offset(0.0, percentCoefficientData[i] * height));
      } else {
        double cp1H = 0.0, cpH2 = 0.0;
        double cp1X = 0.0, cp2X = 0.0;
        cp1X = (nextStepX - stepWidth * 0.35).abs();
        cp2X = (nextStepX - stepWidth * 0.65).abs();
        cp1H = percentCoefficientData[i - 1] * height;
        cpH2 = percentCoefficientData[i] * height;
        path.cubicTo(cp1X, cp1H, cp2X, cpH2, nextStepX,
            percentCoefficientData[i] * height);
        coordinates.add(Offset(nextStepX, percentCoefficientData[i] * height));
      }
      nextStepX += stepWidth;
    }
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
        Offset(coordinates[indexMaxValues].dx, coordinates[indexMaxValues].dy),
        9.0,
        cirlclePaint(
            color: isDarkTheme
                ? AppColorsUtility.orange
                : AppColorsUtility.orange));
    canvas.drawCircle(
        Offset(coordinates[indexMaxValues].dx, coordinates[indexMaxValues].dy),
        4.0,
        cirlclePaint(color: isDarkTheme ? Colors.black : Colors.white));

    // max values
    canvas.drawCircle(
        Offset(coordinates[indexMinValues].dx, coordinates[indexMinValues].dy),
        9.0,
        cirlclePaint(
            color: isDarkTheme
                ? AppColorsUtility.orange
                : AppColorsUtility.orange));
    canvas.drawCircle(
        Offset(coordinates[indexMinValues].dx, coordinates[indexMinValues].dy),
        4.0,
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
    double minValue = cryptoMoneyData[indexMinValue];
    double maxValue = cryptoMoneyData[indexMaxValue];
    Offset minOffset = coordinates[indexMinValue];
    Offset maxOffset = coordinates[indexMaxValue];

    TextPainter minPainter =
        textPainter(MoneyFormatterUtility.dollarFormat(minValue.toString()));
    TextPainter maxPainter =
        textPainter(MoneyFormatterUtility.dollarFormat(maxValue.toString()));

    minPainter.paint(canvas, Offset(minOffset.dx, minOffset.dy * 1.1));
    maxPainter.paint(canvas, Offset(maxOffset.dx, maxOffset.dy * 0.85));
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
}
