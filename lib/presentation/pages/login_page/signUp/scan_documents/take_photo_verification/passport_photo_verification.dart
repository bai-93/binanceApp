import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_verification/base_verification_camera.dart';
import 'package:camera/camera.dart';
import 'package:sheker/main.dart';

class PassportPhotoVerification extends BaseScreen {
  const PassportPhotoVerification({super.key});

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
              print("Something another == $error");
          }
          print("SOME SOME == ${error}");
        }
      });
    }
  }

  @override
  void photoTapButton() {
    if (isReady) {
      if (typeOfPhoto == PhotoType.passportPhoto) {
        debugPrint("passport photo");
        takePhoto();
      } else {
        debugPrint("selfie photo");
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
