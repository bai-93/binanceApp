import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_verification/base_verification_camera.dart';
import 'package:camera/camera.dart';
import 'package:sheker/main.dart';

class PassportPhotoVerification extends BaseScreen {
  bool isPassportPhoto;
  PassportPhotoVerification(this.isPassportPhoto, {super.key});

  @override
  State<PassportPhotoVerification> createState() =>
      _PassportPhotoVerificationState();
}

class _PassportPhotoVerificationState
    extends BaseScreenState<PassportPhotoVerification>
    with BaseScreenVerificationMixin {
  CameraController? _cameraController;
  bool isReady = false;

  @override
  PhotoType get typeOfPhoto =>
      widget.isPassportPhoto ? PhotoType.passportPhoto : PhotoType.selfiePhoto;

  @override
  AppBar customAppbar({double from = 0, double to = 0}) {
    return super.customAppbar(from: 0.7, to: 0.8);
  }

  @override
  void initState() {
    configureCameraController();
    super.initState();
  }

  Future<void> configureCameraController() async {
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await _cameraController?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          isReady = true;
        });
      }).catchError((Object error) {
        if (error is CameraException) {
          switch (error.code) {
            case 'CameraAccessDeniedWithoutPrompt':
              debugPrint("CAMERA DENIED");
              break;
            case 'AudioAccessDenied':
              debugPrint("AUDIO DENIED");
              break;
            default:
              debugPrint(error.toString());
          }
        }
      });
    }
  }

  @override
  void photoTapButton() {
    if (typeOfPhoto == PhotoType.passportPhoto) {
      context.pushReplacement('/sign_up/selfie_verfication');
      // takePhoto();
    } else {
      context.pushReplacement('/sign_up/success_verification');
      // takePhoto();
    }
    if (isReady) {
      if (typeOfPhoto == PhotoType.passportPhoto) {
        context.pushReplacement('/sign_up/selfie_verfication');
        takePhoto();
      } else {
        context.pushReplacement('/sign_up/success_verification');
        takePhoto();
      }
    }
  }

  Future<void> takePhoto() async {
    if (_cameraController == null) {
      debugPrint("camera is nul");
      return;
    } else {
      try {
        _cameraController!.pausePreview();
        XFile file = await _cameraController!.takePicture();
        debugPrint(file.path);
      } on CameraException catch (error) {
        debugPrint("PICTURE EXCEPTION");
      }
    }
  }

  @override
  Widget cameraLayer() {
    if (isReady) {
      if (_cameraController!.value.isInitialized) {
        return FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CameraPreview(_cameraController!)),
        );
      } else {
        return const Center();
      }
    } else {
      return const Center();
    }
  }
}
