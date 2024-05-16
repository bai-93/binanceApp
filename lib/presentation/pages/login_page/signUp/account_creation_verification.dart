import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';

class SignUpAccountCreationVerification extends BaseScreenStateless {
  SignUpAccountCreationVerification({super.key});

  @override
  AppBar? typeOfAppbar({AppbarType type = AppbarType.none}) {
    return super.typeOfAppbar(type: AppbarType.empty);
  }

  @override
  AppBar emptyAppBar(
      {Color? backgroundColor, Widget? title, Color? backButtonColor}) {
    return super.emptyAppBar(backButtonColor: AppColorsUtility.secondary);
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColorsUtility.lightBackground,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              child: Text(
                'Get started in 3 easy steps',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0, color: AppColorsUtility.text),
              ),
            ),
            Image.asset('lib/images/login/signup/illustration.png',
                width: sizeOfScreen.width - 53.0, height: 284),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 91.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22.0, left: 10.0),
                      child: Container(
                        height: 120,
                        width: 2.0,
                        color: AppColorsUtility.onboardingPrimary,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      stepVerificationsRow('1', 'Create your account'),
                      const SizedBox(height: 32.0),
                      stepVerificationsRow('2', 'Submit document'),
                      const SizedBox(height: 32.0),
                      stepVerificationsRow('3', 'Selfie verification')
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 56.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 98.0),
              child: ElevatedButton(
                  onPressed: () {
                    debugPrint("Continue");
                    context.push('/sign_up/add_mail');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      fixedSize: Size(sizeOfScreen.width - 32.0, 48.0),
                      backgroundColor: AppColorsUtility.onboardingPrimary,
                      foregroundColor: Colors.grey.shade200,
                      splashFactory: NoSplash.splashFactory),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: AppColorsUtility.surface, fontSize: 16.0),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget stepVerificationsRow(String number, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 22.0,
          height: 22.0,
          decoration: BoxDecoration(
              color: AppColorsUtility.onboardingPrimary, shape: BoxShape.circle),
          child: Text(
            number,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColorsUtility.surface, fontSize: 16.0),
          ),
        ),
        const SizedBox(width: 14.0),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(color: AppColorsUtility.text, fontSize: 16.0),
          ),
        )
      ],
    );
  }
}
