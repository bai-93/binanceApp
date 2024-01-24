import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/onboarding/onboarding.dart';
import 'package:sheker/utilities/app_colors.dart';

enum AppbarType { onboarding, signUp, custom, none }

abstract class BaseScreenStateless extends StatelessWidget {
  Size sizeOfScreen = Size(0.0, 0.0);

  BaseScreenStateless({super.key});

  Widget body() {
    return Container(color: Colors.yellow);
  }

  AppBar _onboardingAppbar() {
    return AppBar(
      backgroundColor: AppColors.backgroundWhiteTheme,
      surfaceTintColor: Colors.transparent,
      title: Image.asset('lib/images/login/signup/coinmoney_appbar.png'),
    );
  }

  AppBar _signUpAppbar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.backgroundWhiteTheme,
      title: Image.asset('lib/images/login/signup/coinmoney_appbar.png'),
    );
  }

  AppBar customAppbar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
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

  void getSizeScreen(BuildContext context) {
    sizeOfScreen = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    getSizeScreen(context);
    if (typeOfAppbar() != null) {
      return Scaffold(
        backgroundColor: AppColors.backgroundWhiteTheme,
        appBar: typeOfAppbar(),
        body: body(),
      );
    } else {
      return body();
    }
  }
}

class TestBaseScreenUse extends BaseScreenStateless {
  TestBaseScreenUse({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
