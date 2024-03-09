import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/utilities/app_colors.dart';

class ScanDocuments extends BaseScreen {
  const ScanDocuments({super.key});

  @override
  State<ScanDocuments> createState() => _ScanDocumentsState();
}

class _ScanDocumentsState extends BaseScreenState<ScanDocuments>
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
      backgroundColor: AppColors.backgroundWhiteTheme,
      title: VerificationStep(
        0.5,
        0.72,
      ),
    );
  }

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 24.0,
          ),
          Text(
            'Scan document',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.text, fontSize: 32.0),
          ),
          Text(
            'Place the document in the frame until all 4 edges align around the document and turn blue',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.text, fontSize: 14.0),
          ),
          const SizedBox(
            height: 97.0,
          ),
          SizedBox(
            height: 184,
            width: 323,
            child: Center(
              child: Stack(children: [
                Positioned(
                    top: 0.0,
                    child: Image.asset('lib/images/login/signup/passport.png')),
                Image.asset('lib/images/login/signup/autofocus.png')
              ]),
            ),
          ),
          const SizedBox(
            height: 107.0,
          ),
          Container(
            width: sizeOfScreen().width,
            decoration: BoxDecoration(
                color: AppColors.otline,
                borderRadius: const BorderRadius.all(Radius.circular(14.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 26.0, bottom: 26.0, left: 10.0),
                    child: SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child:
                          Image.asset('lib/images/login/signup/lock_light.png'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 14.0, top: 14.0, bottom: 14.0),
                      child: Text(
                        'The data you share will be encrypted, stored securely, and only used to verify your identity',
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.secondary, fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 48.0,
            width: sizeOfScreen().width,
            child: ElevatedButton(
                onPressed: () {
                  context.push('/sign_up/take_photo_verification', extra: true);
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
          const SizedBox(height: 98)
        ],
      ),
    );
  }
}
