import 'package:flutter/material.dart';

class SliderTrackCustomShape extends RoundedRectSliderTrackShape {
  double value;
  SliderTrackCustomShape(this.value);

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required Offset thumbCenter,
      Offset? secondaryOffset,
      bool isDiscrete = true,
      bool isEnabled = true,
      double additionalActiveTrackHeight = 0}) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final radius = trackRect.height * 0.5; //todo: use your trackHeightRatio
    final thumbWidth =
        sliderTheme.thumbShape!.getPreferredSize(isEnabled, isDiscrete).width;

    final Path path = Path();
    path.moveTo(trackRect.left - 1.0, trackRect.top + trackRect.height * 0.22);
    path.lineTo(trackRect.width + thumbWidth + 5.0, trackRect.top);
    path.arcToPoint(
      Offset(trackRect.width + thumbWidth + 5.0, trackRect.bottom),
      radius: Radius.circular(radius),
    );
    path.lineTo(trackRect.left - 1.0, trackRect.height * 0.6);
    path.arcToPoint(Offset(trackRect.left - 3.5, trackRect.height * 0.3),
        radius: Radius.circular(radius));
    path.close();

    final Path inactivePath = makeInactivePath(trackRect, thumbWidth, radius);
    final Path activePath =
        makeActivePath(trackRect, thumbWidth, radius, value / 100.0);

    // final Paint trackPaint = Paint();
    context.canvas.drawPath(inactivePath, inactivePaint);
    context.canvas.drawPath(activePath, activePaint);
  }

  Path makeInactivePath(Rect trackRect, double thumbWidth, double radius) {
    final Path path = Path();
    path.moveTo(trackRect.left - 1.0, trackRect.top + trackRect.height * 0.22);
    path.lineTo(trackRect.width + thumbWidth + 5.0, trackRect.top);
    path.arcToPoint(
      Offset(trackRect.width + thumbWidth + 5.0, trackRect.bottom),
      radius: Radius.circular(radius),
    );
    path.lineTo(trackRect.left - 1.0, trackRect.height * 0.6);
    path.arcToPoint(Offset(trackRect.left - 3.5, trackRect.height * 0.3),
        radius: Radius.circular(radius));
    path.close();
    return path;
  }

  Path makeActivePath(
      Rect trackRect, double thumbWidth, double radius, double percentOfWAy) {
    final Path path = Path();
    path.moveTo(trackRect.left - 1.0, trackRect.top + trackRect.height * 0.22);
    path.lineTo(
        (trackRect.width * percentOfWAy) + thumbWidth + 5.0, trackRect.top);
    path.arcToPoint(
      Offset((trackRect.width * percentOfWAy) + thumbWidth + 5.0,
          trackRect.bottom),
      radius: Radius.circular(radius),
    );
    path.lineTo(trackRect.left - 1.0, trackRect.height * 0.6);
    path.arcToPoint(Offset(trackRect.left - 3.5, trackRect.height * 0.3),
        radius: Radius.circular(radius));
    path.close();
    return path;
  }
}
