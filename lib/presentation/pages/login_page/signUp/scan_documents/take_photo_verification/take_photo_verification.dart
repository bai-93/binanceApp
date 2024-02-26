import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/config/base_widgets/base_verification/base_verification_camera.dart';
import 'package:sheker/uicomponent/camera_mask.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/utilities/app_colors.dart';

class TakePhotoVerification extends BaseScreen {
  const TakePhotoVerification({super.key});

  @override
  State<TakePhotoVerification> createState() => _TakePhotoVerificationState();
}

class _TakePhotoVerificationState extends BaseScreenState<TakePhotoVerification>
    with BaseScreenVerificationMixin {
  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      leading: BackButton(color: AppColors.secondary),
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: VerificationStep(
        0.65,
        0.8,
      ),
    );
  }

  @override
  Widget cameraLayer() {
    return Stack(children: [
      Container(
        color: Colors.black,
        width: sizeOfScreen().width,
        height: sizeOfScreen().height,
      ),
      ClipPath(
        clipper: CustomCameraShapeMaskClipper(),
        child: Container(
          color: AppColors.cameraBackgroundColor,
          width: sizeOfScreen().width,
          height: sizeOfScreen().height,
        ),
      ),
    ]);
  }

  @override
  Widget body() {
    return Container(
      height: sizeOfScreen().height,
      width: sizeOfScreen().width,
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 19.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Center(
              child: Text(
                'Scan document',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.surface, fontSize: 32.0),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Now hold the phone directly over the passport, when the frame turns blue, take the picture.',
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.surface, fontSize: 14.0),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  debugPrint("shot button");
                },
                child: SizedBox(
                  height: 78.0,
                  width: 78.0,
                  child: Image.asset(
                    'lib/images/login/signup/photo_button.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}