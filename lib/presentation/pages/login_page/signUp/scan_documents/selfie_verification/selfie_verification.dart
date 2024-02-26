import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/utilities/app_colors.dart';

class SelfieVerification extends BaseScreen {
  const SelfieVerification({super.key});

  @override
  State<SelfieVerification> createState() => _SelfieVerificationState();
}

class _SelfieVerificationState extends BaseScreenState<SelfieVerification>
    with BaseScreenMixin {
  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    // TODO: implement typeAppbar
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.backgroundWhiteTheme,
      title: VerificationStep(
        0.78,
        0.8,
      ),
    );
  }

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(children: [
        const SizedBox(height: 24.0),
        Text(
          'Selfie verification',
          softWrap: true,
          style: TextStyle(color: AppColors.text, fontSize: 32.0),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          'We will complete the photo in your document with your selfie to confirm your identity',
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.text, fontSize: 14.0),
        ),
        const SizedBox(
          height: 40.0,
        ),
        SizedBox(
          height: 297.0,
          width: 215.0,
          child: Stack(
            children: [
              Image.asset('lib/images/login/signup/autofocus_verification.png'),
              Center(
                child: SizedBox(
                    width: 195.0,
                    height: 260.0,
                    child: Image.asset('lib/images/login/signup/objects.png')),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 51.0,
        ),
        Container(
          width: sizeOfScreen().width,
          decoration: BoxDecoration(
              color: AppColors.otline,
              borderRadius: const BorderRadius.all(Radius.circular(14.0))),
          child: Row(
            children: [
              const SizedBox(
                width: 14.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0, bottom: 26.0),
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child:
                        Image.asset('lib/images/login/signup/lock_light.png')),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 14.0, bottom: 14.0, right: 14.0),
                  child: Text(
                    'The data you share will be encrypted, stored securely, and only used to verify your identity',
                    style:
                        TextStyle(color: AppColors.secondary, fontSize: 14.0),
                    softWrap: true,
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: 48.0,
          width: sizeOfScreen().width,
          child: ElevatedButton(
              onPressed: () {
                debugPrint("Open camera");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.onboardingPrimary,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)))),
              child: Text(
                'Open camera',
                style: TextStyle(color: AppColors.surface, fontSize: 16.0),
              )),
        ),
        const SizedBox(height: 98.0)
      ]),
    );
  }
}
