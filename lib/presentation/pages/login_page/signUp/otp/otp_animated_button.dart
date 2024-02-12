import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/component/mark_positive_draw.dart';
import 'package:sheker/presentation/pages/login_page/signUp/otp/otp_arc_refresh.dart';
import 'package:sheker/utilities/app_colors.dart';

class OtpButtonAnimated extends StatefulWidget {
  const OtpButtonAnimated({super.key});

  @override
  State<OtpButtonAnimated> createState() => _OtpButtonAnimatedState();
}

class _OtpButtonAnimatedState extends State<OtpButtonAnimated>
    with TickerProviderStateMixin {
// first stage of animaiton: shrinking size, change color
  late AnimationController controller;
  late Animation<double?> widthAnim;
  late Animation<double> positionedAnim;
  late Animation<Color?> colorTextAnim;
  late Animation<Color?> colorBackgroundAnim;
  late Animation<double> opacityText;

// second stage of animation: rotate
  late AnimationController controllerRotate;
  late Animation<double> rotateAnim;

// final stage of animation: large width, change color, hide refresh indicator
  late AnimationController controllerFinal;
  late AnimationController controllerOpacityFinal;
  late Animation<double> opacityFinal;
  late Animation<double> widthAnimFinal;
  late Animation<Color?> colorBackgroundFinal;
  late Animation<Color?> colorRefreshIndicatorFinal;

  @override
  void initState() {
    super.initState();
    animationSettings();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        controller.forward();
      }
    });
  }

  void animationSettings() {
    // first stage
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controllerRotate.forward();
        }
      });
    widthAnim = Tween<double>(begin: 400, end: 48.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    positionedAnim = Tween<double>(begin: 0.0, end: 600.0).animate(controller);
    colorTextAnim =
        ColorTween(begin: AppColors.secondary, end: AppColors.surface)
            .animate(controller);

    colorBackgroundAnim =
        ColorTween(begin: AppColors.otline, end: AppColors.surface)
            .animate(controller);
    opacityText = Tween<double>(begin: 1.0, end: 0.0).animate(controller);

    // second stage
    controllerRotate =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    rotateAnim = Tween<double>(begin: 0, end: pi * 2).animate(controllerRotate)
      ..addStatusListener((status) {
        if (rotateAnim.status == AnimationStatus.completed) {
          controllerRotate.stop();
          controllerFinal.forward();
          controllerOpacityFinal.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });

    // final stage
    controllerFinal = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    controllerOpacityFinal = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    widthAnimFinal =
        Tween<double>(begin: 48.0, end: 700.0).animate(controllerFinal)
          ..addListener(() {
            setState(() {});
          });
    colorBackgroundFinal =
        ColorTween(begin: AppColors.surface, end: AppColors.onboardingPrimary)
            .animate(controllerFinal)
          ..addListener(() {
            setState(() {});
          });

    colorRefreshIndicatorFinal =
        ColorTween(begin: AppColors.surface, end: Colors.transparent)
            .animate(controllerFinal)
          ..addListener(() {
            setState(() {});
          });
    opacityFinal =
        Tween<double>(begin: 1.0, end: 0.0).animate(controllerOpacityFinal)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controllerRotate.dispose();
    controllerFinal.dispose();
    controllerOpacityFinal.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 15),
        child: Stack(children: [
          Center(
            child: controllerFinal.status == AnimationStatus.completed
                ? containerButtonInkWell()
                : Container(
                    height: 48.0,
                    width: controllerRotate.status == AnimationStatus.completed
                        ? widthAnimFinal.value
                        : widthAnim.value,
                    decoration: BoxDecoration(
                        color:
                            controllerRotate.status == AnimationStatus.completed
                                ? colorBackgroundFinal.value
                                : colorBackgroundAnim.value,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: opacityFinal.value,
                          child: Transform.rotate(
                              angle: rotateAnim.value,
                              child: OtpArRefresh(
                                controller,
                              )),
                        )
                      ],
                    ),
                  ),
          ),
          Positioned(
            left: positionedAnim.value,
            child: InkWell(
              onTap: () {
                debugPrint("entered");
              },
              borderRadius: const BorderRadius.all(Radius.circular(24.0)),
              child: Opacity(
                opacity: opacityText.value,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width - 32,
                  height: 48.0,
                  child: Center(
                    child: Opacity(
                      opacity: opacityText.value,
                      child: Text(
                        'Entered',
                        style: TextStyle(
                            color: colorTextAnim.value, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget containerButtonInkWell() {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      onTap: () {
        debugPrint("ink well button ON TAP");
      },
      child: Container(
        height: 48.0,
        width: 700,
        decoration: BoxDecoration(
            color: AppColors.onboardingPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(24.0))),
        child: CustomPaint(painter: PositiveMarkDraw()),
      ),
    );
  }
}
