import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/onboarding/onboarding.dart';
import 'package:sheker/utilities/app_colors.dart';

enum AppbarType { onboarding, signUp, custom, none }

abstract class BaseScreenStateless extends StatelessWidget {
  const BaseScreenStateless({super.key});

  Widget body() {
    return Container(color: Colors.yellow);
  }

  AppBar _onboardingAppbar() {
    return AppBar(
      backgroundColor: AppColors.backgroundWhiteTheme,
      title: Image.asset('lib/images/login/signup/coinmoney_appbar.png'),
    );
  }

  AppBar _signUpAppbar() {
    return AppBar(
      backgroundColor: AppColors.backgroundWhiteTheme,
      title: Image.asset('lib/images/login/signup/coinmoney_appbar.png'),
    );
  }

  AppBar customAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        'override !customAppbar! method',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  AppBar? typeOfAppbar({AppbarType type = AppbarType.none}) {
    switch (type) {
      case AppbarType.onboarding:
        return _onboardingAppbar();
      case AppbarType.signUp:
        return _signUpAppbar();
      case AppbarType.custom:
        return customAppbar();
      case AppbarType.none:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (typeOfAppbar() != null) {
      return Scaffold(
        appBar: typeOfAppbar(),
        body: body(),
      );
    } else {
      return body();
    }
  }
}

class TestBaseScreenUse extends BaseScreenStateless {
  const TestBaseScreenUse({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
