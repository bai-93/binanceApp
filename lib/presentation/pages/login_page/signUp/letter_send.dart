import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';

class LetterSend extends BaseScreen {
  String emailData = "email";
  LetterSend(this.emailData, {super.key});

  @override
  State<LetterSend> createState() => _LetterSendState();
}

class _LetterSendState extends BaseScreenState<LetterSend>
    with BaseScreenMixin {
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
        0.15,
      ),
    );
  }

  @override
  Widget body() {
    return Container(
      color: AppColorsUtility.lightBackground,
      child: Column(
        children: [
          const SizedBox(height: 56.0),
          Image.asset(
            'lib/images/login/signup/illustration_letter.png',
            height: 346.0,
            width: sizeOfScreen().width,
          ),
          const SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 19.0),
            child: Text('Confirm your email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0, color: AppColorsUtility.text)),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 18.0),
            child: Text(
              'We just sent you an email to ${widget.emailData}',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(color: AppColorsUtility.text, fontSize: 14.0),
            ),
          ),
          const SizedBox(height: 56.0),
          ElevatedButton(
            onPressed: () {
              context.push('/sign_up/otp', extra: widget.emailData);
            },
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                backgroundColor: AppColorsUtility.onboardingPrimary,
                fixedSize: Size(sizeOfScreen().width - 32.0, 48.0)),
            child: Center(
                child: Text(
              'Confirm',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColorsUtility.surface, fontSize: 16.0),
            )),
          ),
          const SizedBox(height: 24.0),
          RichText(
              text: TextSpan(
                  text: 'I ',
                  style: TextStyle(color: AppColorsUtility.text, fontSize: 14.0),
                  children: [
                TextSpan(
                    text: 'didn’t receive',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint("didn't receive");
                      },
                    style: TextStyle(
                        color: AppColorsUtility.onboardingPrimary, fontSize: 14.0)),
                TextSpan(
                    text: ' my email',
                    style: TextStyle(color: AppColorsUtility.text, fontSize: 14.0))
              ])),
          const SizedBox(height: 58.0)
        ],
      ),
    );
  }
}
