import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

enum AppbarType { onboarding, signUp, custom, none, empty }

abstract class BaseScreenStateless extends StatelessWidget {
  Size sizeOfScreen = Size(0.0, 0.0);
  BuildContext? buildContext;

  BaseScreenStateless({super.key});

  Widget body(BuildContext context);

  Widget? leadingAppBar() {
    return null;
  }

  List<Widget>? actionsAppBar() {
    return null;
  }

  Widget? title() {}

  AppBar _onboardingAppbar() {
    return AppBar(
      backgroundColor: AppColors.lightBackground,
      surfaceTintColor: Colors.transparent,
      title: Image.asset('lib/images/login/signup/coinmoney_appbar.png'),
    );
  }

  AppBar _signUpAppbar() {
    return AppBar(
      leading: leadingAppBar(),
      actions: actionsAppBar(),
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.lightBackground,
      title: Center(
          child: title() ??
              Image.asset('lib/images/login/signup/coinmoney_appbar.png')),
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
      backgroundColor: backgroundColor ?? AppColors.lightBackground,
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
    buildContext = context;
    _getSizeScreen(context);
    if (typeOfAppbar() != null) {
      return Scaffold(
        backgroundColor: AppColors.lightBackground,
        appBar: typeOfAppbar(),
        body: SingleChildScrollView(child: body(context)),
      );
    } else {
      return SingleChildScrollView(child: body(context));
    }
  }
}
