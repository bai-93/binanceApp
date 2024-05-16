import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

enum typeOfCircle { empty, middle, full }

class CircleContainer extends StatelessWidget {
  String text;
  typeOfCircle? item;
  CircleContainer(this.text, {this.item = typeOfCircle.empty, super.key});
  @override
  Widget build(BuildContext context) {
    Color? backgroundColor, textColor;
    Color borderColor = AppColorsUtility.otline;

    switch (item) {
      case typeOfCircle.empty:
        backgroundColor = AppColorsUtility.surface;
        textColor = AppColorsUtility.otline;
        borderColor = AppColorsUtility.otline;
        break;
      case typeOfCircle.middle:
        backgroundColor = AppColorsUtility.surface;
        textColor = AppColorsUtility.text;
        borderColor = AppColorsUtility.onboardingPrimary;
        break;
      case typeOfCircle.full:
        backgroundColor = AppColorsUtility.onboardingPrimary;
        textColor = AppColorsUtility.surface;
        borderColor = AppColorsUtility.onboardingPrimary;
        break;
      default:
    }

    return Container(
      width: 22.0,
      height: 22.0,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(39.0))),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16.0),
        ),
      ),
    );
  }
}
