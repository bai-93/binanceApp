import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/graph_data_normalize.dart';

class SmallGraphicComponent extends CustomPainter {
  CryptoHistoryPriceListModel model;
  List<double> percentCoefficient = [];
  double percentOf24Hr;
  bool isAscentOrDescent = true;

  SmallGraphicComponent(this.model, this.percentOf24Hr) {
    isAscentOrDescent = percentOf24Hr >= 0.0 ? true : false;
    settingsModel();
  }
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = paintConfigure();
    var path = drawGraph(canvas, size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void settingsModel() {
    percentCoefficient = GraphDataNormalizeUtility.normalizeData(model);
  }

  Paint paintConfigure() {
    var paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 1.0;
    paint.color =
        isAscentOrDescent ? AppColorsUtility.green : AppColorsUtility.orange;
    return paint;
  }

  Path drawGraph(Canvas canvas, Size size) {
    var path = Path();
    final stepWidth = size.width / percentCoefficient.length;
    double nextStepX = stepWidth / 2.0;
    bool isFirst = true;
    int nextIndex = 0;
    for (int i = 0; i < percentCoefficient.length; i++) {
      if (isFirst) {
        isFirst = false;
        path.moveTo(0.0, percentCoefficient[i] * size.height);
        path.quadraticBezierTo(
            nextStepX + stepWidth / 2.0,
            percentCoefficient[i + 1] * size.height,
            nextStepX + stepWidth,
            percentCoefficient[i + 1] * size.height);
      } else {
        if (nextIndex + 1 < percentCoefficient.length) {
          path.quadraticBezierTo(
              nextStepX + stepWidth / 2.0,
              percentCoefficient[nextIndex + 1] * size.height,
              nextStepX + stepWidth,
              percentCoefficient[nextIndex + 1] * size.height);
        } else {
          path.quadraticBezierTo(
              nextStepX + stepWidth,
              percentCoefficient[i] * size.height,
              nextStepX + stepWidth,
              percentCoefficient[i] * size.height);
        }
      }
      nextStepX += stepWidth;
      nextIndex++;
    }
    return path;
  }
}
