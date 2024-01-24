import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';

class SignUpWelcomeScreen extends BaseScreenStateless {
  const SignUpWelcomeScreen({super.key});

  @override
  AppBar? typeOfAppbar({AppbarType type = AppbarType.none}) {
    return super.typeOfAppbar(type: AppbarType.signUp);
  }

  @override
  Widget body() {
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
        ]),
      ),
    );
  }
}
