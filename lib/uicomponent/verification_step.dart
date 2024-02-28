import 'package:flutter/material.dart';
import 'package:sheker/uicomponent/animate_line_custom_painter.dart';
import 'package:sheker/uicomponent/circle_container.dart';
import 'package:sheker/utilities/app_colors.dart';

class VerificationStep extends StatefulWidget {
  double from;
  double to;
  VerificationStep(this.from, this.to, {super.key});

  @override
  State<VerificationStep> createState() => _VerificationStepState();
}

class _VerificationStepState extends State<VerificationStep>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> tweenAnimation;
  List<Widget> circlePoints = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    tweenAnimation = Tween<double>(
            begin: widget.from, end: widget.to > 1.0 ? 1.0 : widget.to)
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        controller.forward();
      }
    });
    configurationOfCircle();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void configurationOfCircle() {
    circlePoints.clear();
    typeOfCircle? first, second, third;
    if (widget.to < 0.41) {
      first = typeOfCircle.middle;
      second = typeOfCircle.empty;
      third = typeOfCircle.empty;
    }
    if (widget.to > 0.4 && widget.to < 0.99) {
      first = typeOfCircle.full;
      second = typeOfCircle.middle;
      third = typeOfCircle.empty;
    }
    if (widget.to == 0.99) {
      first = typeOfCircle.full;
      second = typeOfCircle.full;
      third = typeOfCircle.middle;
    }
    if (widget.to >= 1.0) {
      first = typeOfCircle.full;
      second = typeOfCircle.full;
      third = typeOfCircle.full;
    }
    circlePoints.add(CircleContainer(
      '1',
      item: first,
    ));
    circlePoints.add(CircleContainer('2', item: second));
    circlePoints.add(CircleContainer('3', item: third));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 180,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 11.0, left: 21.0),
            child: Container(
              color: AppColors.otline,
              width: 139.0,
              height: 2.0,
              child: CustomPaint(painter: LineAnimation(tweenAnimation.value)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circlePoints[0],
              const SizedBox(
                width: 57.0,
              ),
              circlePoints[1],
              const SizedBox(
                width: 57.0,
              ),
              circlePoints[2]
            ],
          ),
        ]));
  }
}
