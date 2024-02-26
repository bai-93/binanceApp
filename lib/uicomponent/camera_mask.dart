import 'package:flutter/material.dart';

// left 16, right 17, height 298
class CustomCameraShapeMaskClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path entirePath = Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    Path innerPath = Path()
      ..addRRect(RRect.fromRectXY(
          Rect.fromLTWH(17.0, size.height * 0.34, size.width - 33.0, 298.0),
          10.0,
          10.0));
    Path basePath =
        Path.combine(PathOperation.difference, entirePath, innerPath);
    return basePath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
