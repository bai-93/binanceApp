import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/onboarding/onboarding_description.dart';
import 'package:sheker/utilities/app_colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> coinLogoTweenColor;
  bool flagSize = false;
  bool toTopFlag = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    coinLogoTweenColor = ColorTween(
            begin: AppColors.backgroundWhiteTheme,
            end: AppColors.onboardingPrimary)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    startAnimation();
  }

  void startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 4000), () async {
        if (mounted) {
          setState(() {
            flagSize = true;
          });
        }
      });
      Future.delayed(const Duration(milliseconds: 3000), () async {
        if (mounted) {
          _controller.forward();
          setState(() {
            toTopFlag = true;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.onboardingPrimary,
      body: Stack(children: [
        Column(
          children: [OnboardingDescription()],
        ),
        AnimatedAlign(
          duration: const Duration(milliseconds: 1000),
          alignment: toTopFlag ? Alignment.topCenter : Alignment.center,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 1000),
            padding: EdgeInsets.only(top: toTopFlag ? 52.49 : 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 25.0,
                    height: 28.0,
                    child: Image.asset(
                      'lib/images/onboarding/coinmoney.png',
                      color: coinLogoTweenColor.value,
                    )),
                const SizedBox(
                  width: 8.0,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 1000),
                  alignment:
                      flagSize ? Alignment.centerLeft : Alignment.centerRight,
                  child: SizedBox(
                    width: flagSize ? 120 : 0.0,
                    height: 19.0,
                    child: Image.asset(
                      'lib/images/onboarding/coinmoney_title.png',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
