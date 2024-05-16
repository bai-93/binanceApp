import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/regex_pattern.dart';

class SignUpAddMail extends BaseScreen {
  const SignUpAddMail({super.key});

  @override
  State<SignUpAddMail> createState() => _SignUpAddMailState();
}

class _SignUpAddMailState extends BaseScreenState<SignUpAddMail>
    with BaseScreenMixin {
  final _form = GlobalKey<FormState>();
  final controller = TextEditingController();
  final focus = FocusNode();

  @override
  void initState() {
    super.initState();

    focus.addListener(() {
      debugPrint("focus listener");
    });

    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        setState(() {});
      }
    });
  }

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
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColorsUtility.lightBackground,
      title: VerificationStep(
        0.0,
        0.41,
      ),
    );
  }

  @override
  Widget body() {
    return Container(
      color: AppColorsUtility.lightBackground,
      width: sizeOfScreen().width,
      child: Column(children: [
        Text(
          'What’s your email?',
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(color: AppColorsUtility.text, fontSize: 32.0),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 15.0),
          child: Text(
            'Enter the email address you want to use to register with coinmoney',
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(color: AppColorsUtility.text, fontSize: 14.0),
          ),
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColorsUtility.surface,
                boxShadow: controller.text.isNotEmpty
                    ? null
                    : [
                        BoxShadow(
                            color: AppColorsUtility.internalShadow,
                            offset: const Offset(0.0, -1.0),
                            blurRadius: 2.0)
                      ],
                border: Border.all(
                    color: controller.text.isNotEmpty
                        ? AppColorsUtility.onboardingPrimary
                        : AppColorsUtility.otline),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            height: 48.0,
            child: Form(
              child: TextFormField(
                controller: controller,
                focusNode: focus,
                style: TextStyle(color: AppColorsUtility.text, fontSize: 16.0),
                key: _form,
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Image.asset(
                      'lib/images/login/signup/mail_signup.png',
                      width: 24.0,
                      height: 24.0,
                      alignment: Alignment.center,
                      color: controller.text.isNotEmpty
                          ? AppColorsUtility.onboardingPrimary
                          : AppColorsUtility.otline,
                    ),
                    hintText: 'Email address',
                    hintStyle:
                        TextStyle(color: AppColorsUtility.secondary, fontSize: 16.0),
                    suffixIcon: controller.text.isNotEmpty
                        ? SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: Image.asset(
                              'lib/images/login/signup/check_ring_light.png',
                            ),
                          )
                        : null,
                    border: InputBorder.none),
                onChanged: (String input) {
                  if (RegexPatternUtility.emailValidator(input) == null) {
                    debugPrint(" wrong === ${input}");
                  } else {
                    debugPrint("success == ${input}");
                  }
                },
              ),
            ),
          ),
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
                    style: TextStyle(color: AppColorsUtility.text, fontSize: 14.0),
                    children: [
                  TextSpan(
                      text: 'Login in here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint("Login in here");
                        },
                      style: TextStyle(
                          color: AppColorsUtility.onboardingPrimary, fontSize: 14.0))
                ]))
          ],
        ),
        const SizedBox(height: 114.0),
        ElevatedButton(
            onPressed: controller.text.isNotEmpty
                ? () {
                    context.push('/sign_up/letter_send',
                        extra: controller.text);
                  }
                : null,
            style: ElevatedButton.styleFrom(
                fixedSize: Size(sizeOfScreen().width - 32.0, 48.0),
                splashFactory: NoSplash.splashFactory,
                backgroundColor: controller.text.isNotEmpty
                    ? AppColorsUtility.onboardingPrimary
                    : AppColorsUtility.otline,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)))),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: controller.text.isNotEmpty
                        ? AppColorsUtility.surface
                        : AppColorsUtility.secondary),
              ),
            )),
        const SizedBox(height: 42.0),
        Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 16.0),
            child: Text(
              'By registering you accept our Terms & Conditions and Privacy Policy. Your data will be security encrypted with TLS',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(color: AppColorsUtility.text, fontSize: 12.0),
            )),
        const SizedBox(height: 70.0)
      ]),
    );
  }
}
