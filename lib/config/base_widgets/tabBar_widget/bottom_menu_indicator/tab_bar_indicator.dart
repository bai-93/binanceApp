import 'package:flutter/material.dart';

class DotIndicatorTabBar extends Decoration {
  final Color color;
  final double radius;

  const DotIndicatorTabBar({this.color = Colors.white, this.radius = 3.0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotIndicatorPainter(
        color: color, radius: radius, onChanged: onChanged);
  }
}

class _DotIndicatorPainter extends BoxPainter {
  late final Paint _paint;
  final Color color;
  final double radius;

  _DotIndicatorPainter(
      {required this.color, required this.radius, VoidCallback? onChanged})
      : super(onChanged) {
    _paint = Paint();
    _paint.color = color;
    _paint.style = PaintingStyle.fill;
    _paint.strokeWidth = radius;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    canvas.drawLine(Offset(rect.topLeft.dx + 5.0, rect.topLeft.dy + 1.0),
        Offset(rect.topRight.dx - 5.0, rect.topRight.dy + 1.0), _paint);
  }
}
