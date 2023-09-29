import 'package:flutter/material.dart';

class DotIndicatorTabBar extends Decoration {
  final Color color;
  final double radius;

  DotIndicatorTabBar({this.color = Colors.white, this.radius = 3.0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _DotIndicatorPainter(
        color: this.color, radius: this.radius, onChanged: onChanged);
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
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    canvas.drawCircle(
        Offset(rect.topCenter.dx, rect.topCenter.dy + radius),
        radius,
        _paint);
  }
}
