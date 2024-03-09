import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';

class SignUpWelcomeScreen extends BaseScreenStateless {
  SignUpWelcomeScreen({super.key});

  @override
  AppBar? typeOfAppbar({AppbarType type = AppbarType.none}) {
    return super.typeOfAppbar(type: AppbarType.signUp);
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.backgroundWhiteTheme,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 44.0, left: 16.0, right: 16.0),
            child: Text(
              'Hello! Start your crypto investment today',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(color: AppColors.text, fontSize: 32.0),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          societyAppButtons(() {
            debugPrint('Facebook');
          }, 'facebook', 'Continue with Facebook'),
          const SizedBox(height: 16.0),
          societyAppButtons(() {
            debugPrint('Google');
          }, 'google', 'Continue with Google'),
          const SizedBox(height: 16.0),
          societyAppButtons(() {
            debugPrint('Apple');
          }, 'apple', 'Continue with Apple'),
          const SizedBox(height: 16.0),
          button(() {
            debugPrint("Sign up with email");
            context.push('/sign_up/account_verification');
          }, 'Sign up with email', true),
          const SizedBox(height: 108.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  color: AppColors.otline,
                  height: 1.0,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                'Already have an account?',
                style: TextStyle(color: AppColors.text),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                child: Container(
                  color: AppColors.otline,
                  height: 1.0,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 36.0,
          ),
          button(() {
            context.push('/sign_up/login');
          }, 'Sign in', false),
          const SizedBox(height: 64.0)
        ]),
      ),
    );
  }

  Widget societyAppButtons(
      void Function() onPressed, String imageName, String nameOfButton) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.otline),
                borderRadius: BorderRadius.circular(8.0)),
            fixedSize: Size(sizeOfScreen.width - 32.0, 48.0),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            foregroundColor: Colors.grey.shade300, // highlight color
            splashFactory: NoSplash.splashFactory),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Image.asset('lib/images/login/signup/${imageName}.png',
                  width: 24.0, height: 24.0),
            ),
            const SizedBox(width: 8.0),
            Text(
              nameOfButton,
              style: TextStyle(color: AppColors.text, fontSize: 14.0),
            )
          ],
        ));
  }

  Widget button(void Function() onPressed, String title, bool flag) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            fixedSize: Size(sizeOfScreen.width - 32, 48.0),
            backgroundColor:
                flag ? AppColors.onboardingPrimary : AppColors.surface,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.onboardingPrimary, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            )),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: flag ? AppColors.surface : AppColors.onboardingPrimary,
                fontSize: 16.0),
          ),
        ));
  }
}
