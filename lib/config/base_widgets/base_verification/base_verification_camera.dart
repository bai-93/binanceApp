import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/uicomponent/camera_mask.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import '../../../utilities/app_colors.dart';

enum PhotoType { selfiePhoto, passportPhoto }

mixin BaseScreenVerificationMixin<T extends BaseScreen> on BaseScreenState<T> {
  PhotoType typeOfPhoto = PhotoType.passportPhoto;

  Widget cameraLayer();

  void photoTapButton();

  String getTitle() {
    String temp = '';
    switch (typeOfPhoto) {
      case PhotoType.selfiePhoto:
        temp = 'Selfie verification';
      case PhotoType.passportPhoto:
        temp = 'Scan document';
    }
    return temp;
  }

  String getSubTitle() {
    String temp = '';
    switch (typeOfPhoto) {
      case PhotoType.passportPhoto:
        temp =
            "Now hold the phone directly over the passport, when the frame turns blue, take the picture.";
      case PhotoType.selfiePhoto:
        temp =
            "Hold your phone at eye level and look directly into the camera,\nwhen the frame turns blue take a photo";
      default:
    }
    return temp;
  }

  AppBar customAppbar({double from = 0, double to = 0}) {
    return AppBar(
      leading: BackButton(color: AppColorsUtility.secondary),
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: VerificationStep(
        from,
        to,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(children: [
          Container(
            color: Colors.transparent,
            width: sizeOfScreen().width,
            height: sizeOfScreen().height,
            child: cameraLayer(),
          ),
          ClipPath(
            clipper: CustomCameraShapeMaskClipper(),
            child: Container(
              color: AppColorsUtility.cameraBackgroundColor,
              width: sizeOfScreen().width,
              height: sizeOfScreen().height,
            ),
          ),
          Positioned(
            top: sizeOfScreen().height * 0.34,
            left: 16.8,
            child: SizedBox(
                width: sizeOfScreen().width - 33.0,
                height: 298.0,
                child: Image.asset("lib/images/login/signup/area_photo.png")),
          )
        ]),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: customAppbar(),
          body: SizedBox(
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
                      getTitle(),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: AppColorsUtility.surface, fontSize: 32.0),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    getSubTitle(),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColorsUtility.surface, fontSize: 14.0),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: photoTapButton,
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
          ),
        ),
      ],
    );
  }
}
