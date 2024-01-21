import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/onboarding/onboarding_center_info.dart';
import 'package:sheker/utilities/app_colors.dart';

class OnboardingDescription extends StatefulWidget {
  const OnboardingDescription({super.key});

  @override
  State<OnboardingDescription> createState() => _OnboardingDescriptionState();
}

class _OnboardingDescriptionState extends State<OnboardingDescription>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorBackgroundTween;
  late Animation<Color?> colorButtonTween;

  int count = 0;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    colorBackgroundTween = ColorTween(
            begin: AppColors.onboardingPrimary,
            end: AppColors.backgroundWhiteTheme)
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        if (mounted) {
          controller.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: colorBackgroundTween.value,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OnboardingImageTitle(count),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FilledButton(
                        onPressed: () {
                          if (count != 2) {
                            setState(() {
                              count++;
                            });
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: colorBackgroundTween.value,
                              fontSize: 16.0),
                        ),
                        style: FilledButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width - 32.0, 48.0),
                            backgroundColor: AppColors.onboardingPrimary,
                            splashFactory: NoSplash.splashFactory)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
