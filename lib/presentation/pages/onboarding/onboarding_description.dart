import 'package:flutter/material.dart';
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
      Future.delayed(const Duration(milliseconds: 2900), () {
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
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: colorBackgroundTween.value);
  }
}
