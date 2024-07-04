import 'package:flutter/material.dart';

class SliderOverlayCustomShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(0.0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    Size size = parentBox.size;

    final Paint activePaint = Paint()
      ..color = sliderTheme.overlayColor!
      ..style = PaintingStyle.fill;

    final pathSegment = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height);
    pathSegment.close;

    context.canvas.drawPath(pathSegment, activePaint);
  }
}
