import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';

class SignUpAddMail extends BaseScreen {
  const SignUpAddMail({super.key});

  @override
  State<SignUpAddMail> createState() => _SignUpAddMailState();
}

class _SignUpAddMailState extends BaseScreenState<SignUpAddMail>
    with BaseScreenMixin {
  @override
  bool isActiveBottomSocialApp() {
    return true;
  }

  @override
  Widget bottomSocialApp({onPress? facebook, onPress? apple, onPress? google}) {
    return super.bottomSocialApp(facebook: () {
      debugPrint("hello FACEBOOK");
    }, apple: () {
      debugPrint("hello APPLE");
    }, google: () {
      debugPrint("hello GOOGLE");
    });
  }

  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.signUp);
  }

  @override
  Widget body() {
    return Container(
      color: AppColors.backgroundWhiteTheme,
      width: sizeOfScreen().width,
      child: Column(children: [
        Text(
          'What’s your email?',
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(color: AppColors.text, fontSize: 32.0),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 15.0),
          child: Text(
            'Enter the email address you want to use to register with coinmoney',
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(color: AppColors.text, fontSize: 14.0),
          ),
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SizedBox(
              height: 48.0,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_lock_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Email address',
                    hintStyle:
                        TextStyle(color: AppColors.otline, fontSize: 16.0)),
              )),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Have an account? ',
                    style: TextStyle(color: AppColors.text, fontSize: 14.0),
                    children: [
                  TextSpan(
                      text: 'Login in here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint("Login in here");
                        },
                      style: TextStyle(
                          color: AppColors.onboardingPrimary, fontSize: 14.0))
                ]))
          ],
        ),
        const SizedBox(height: 114.0),
        ElevatedButton(
            onPressed: () {
              debugPrint("Continue");
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(sizeOfScreen().width - 32.0, 48.0),
                splashFactory: NoSplash.splashFactory,
                backgroundColor: AppColors.otline,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)))),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: AppColors.secondary),
              ),
            )),
        const SizedBox(height: 42.0),
        Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 16.0),
            child: Text(
              'By registering you accept our Terms & Conditions and Privacy Policy. Your data will be security encrypted with TLS',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(color: AppColors.text, fontSize: 12.0),
            )),
        const SizedBox(height: 70.0)
      ]),
    );
  }
}
