import 'package:flutter/material.dart';
import 'dart:ui';

class OnboardingPainter extends CustomPainter {
  final FragmentShader shader;
  final double time;

  OnboardingPainter(this.shader, this.time);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    paint.shader = shader;
    paint.color = Colors.transparent;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
