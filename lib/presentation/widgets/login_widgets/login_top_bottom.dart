import 'package:flutter/cupertino.dart';

class TopContentClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();
    path.moveTo(0.0, height * 0.7);
    path.quadraticBezierTo(width * 0.2, height, width * 0.45, height * 0.6);
    path.quadraticBezierTo(width * 0.65, height * 0.2, width, height * 0.45);
    path.lineTo(width, 0.0);
    path.lineTo(width * 0.78, 0.0);
    path.quadraticBezierTo(width * 0.69, height * 0.15, width * 0.55, 20.0);
    path.quadraticBezierTo(width * 0.42, -20.0, width * 0.31, height * 0.1);
    path.quadraticBezierTo(
        width * 0.23, height * 0.2, width * 0.16, height * 0.15);
    path.quadraticBezierTo(width * 0.1, height * 0.09, 10.0, height * 0.15);
    path.lineTo(0.0, height * 0.17);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomContentClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var pathClip = Path();
    pathClip.moveTo(0.0, height * 0.23);
    pathClip.quadraticBezierTo(
        width * 0.16, height * 0.4, width * 0.4, height * 0.2);
    pathClip.quadraticBezierTo(width * 0.75, -10.0, width, height * 0.2);
    pathClip.lineTo(width, height);
    pathClip.lineTo(0.0, height);
    pathClip.close();
    return pathClip;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
