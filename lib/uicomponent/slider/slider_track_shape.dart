import 'dart:math';
import 'package:flutter/material.dart';

class SliderTrackCustomShape extends SliderTrackShape {
  double value;

  SliderTrackCustomShape(this.value);
  @override
  Rect getPreferredRect(
      {required RenderBox parentBox,
      Offset offset = Offset.zero,
      required SliderThemeData sliderTheme,
      bool isEnabled = false,
      bool isDiscrete = false}) {
    final double thumbWidth =
        sliderTheme.thumbShape!.getPreferredSize(false, false).width;
    final double trackHeight = sliderTheme.trackHeight ?? 0.0;

    final double trackWidth = parentBox.size.width - thumbWidth;
    final double trackLeft = (offset.dx - thumbWidth / 1).abs();
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required Offset thumbCenter,
      Offset? secondaryOffset,
      bool isEnabled = false,
      bool isDiscrete = false,
      required TextDirection textDirection}) {
    //
    double percentSlider = value / 100;
    //
    final Rect trackRect = getPreferredRect(
        parentBox: parentBox, sliderTheme: sliderTheme, offset: offset);
    //
    final inActivePaint =
        inActiveTrackLayer(sliderTheme.inactiveTrackColor ?? Colors.grey);

    final secondLayerPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!
      ..style = PaintingStyle.fill;
    //
    final Path inActiveTrackPath = makeTrackPath();
    // inActiveTrackPath.moveTo(20.0, 15.0);
    // inActiveTrackPath.addRect(Rect.fromLTWH(
    //     20.0, 5.0, trackRect.width * percentSlider, trackRect.height));
    // inActiveTrackPath.addArc(
    //     Rect.fromLTWH(18.0, 5.0, 5.0, trackRect.height), pi / 2, pi);

    // context.canvas.drawPath(secondLayerPath, secondLayerPaint);
    context.canvas.drawPath(inActiveTrackPath, inActivePaint);
  }

  Paint inActiveTrackLayer(Color inActiveColor) {
    Paint paint = Paint();
    paint.color = inActiveColor;
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    return paint;
  }

  Path makeTrackPath() {
    Path path = Path();
    path.moveTo(15.0, 15.0);
    path.quadraticBezierTo(10.0, 3, 15.0, 2.0);
    return path;
  }
}

// final Size thumbSize =
    //     sliderTheme.thumbShape!.getPreferredSize(isEnabled, isDiscrete);
