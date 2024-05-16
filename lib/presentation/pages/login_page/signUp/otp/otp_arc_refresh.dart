import 'package:flutter/material.dart';
import 'package:sheker/uicomponent/arc_draw.dart';
import 'package:sheker/utilities/app_colors.dart';

class OtpArRefresh extends StatelessWidget {
  Animation<double> controllerAnimation;
  bool flag;
  late Animation<Color?> colorBackgroundAnim;
  late Animation<Color?> colorArcPaintAnim;

  OtpArRefresh(this.controllerAnimation, {this.flag = false, super.key})
      : colorBackgroundAnim = ColorTween(
                begin: flag ? AppColorsUtility.surface : AppColorsUtility.otline,
                end: flag ? AppColorsUtility.onboardingPrimary : AppColorsUtility.surface)
            .animate(controllerAnimation);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
          color: colorBackgroundAnim.value,
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      child: CustomPaint(
        painter: ArcDraw(controllerAnimation.value),
      ),
    );
  }
}
