import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/onboarding/onboarding.dart';
import 'package:sheker/utilities/app_colors.dart';

enum AppbarType { onboarding, signUp, custom, none, empty }

abstract class BaseScreenStateless extends StatelessWidget {
  Size sizeOfScreen = Size(0.0, 0.0);

  BaseScreenStateless({super.key});

  Widget body(BuildContext context) {
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

  AppBar emptyAppBar(
      {Color? backgroundColor, Widget? title, Color? backButtonColor}) {
    return AppBar(
      title: title,
      surfaceTintColor: Colors.transparent,
      leading: BackButton(
        color: backButtonColor,
        style: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      ),
      backgroundColor: backgroundColor ?? AppColors.backgroundWhiteTheme,
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
      case AppbarType.empty:
        return emptyAppBar();
      case AppbarType.none:
        return null;
    }
  }

  void _getSizeScreen(BuildContext context) {
    sizeOfScreen = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    _getSizeScreen(context);
    if (typeOfAppbar() != null) {
      return Scaffold(
        backgroundColor: AppColors.backgroundWhiteTheme,
        appBar: typeOfAppbar(),
        body: body(context),
      );
    } else {
      return body(context);
    }
  }
}

//here example how we have to use
class TestBaseScreenUse extends BaseScreenStateless {
  TestBaseScreenUse({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
