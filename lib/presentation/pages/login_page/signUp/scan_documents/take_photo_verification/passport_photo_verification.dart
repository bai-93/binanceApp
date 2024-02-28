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
  late CameraController? _controller;

  @override
  AppBar customAppbar({double from = 0, double to = 0}) {
    return super.customAppbar(from: 0.7, to: 0.8);
  }

  @override
  void initState() {
    super.initState();
    configureCameraController();
  }

  Future<void> configureCameraController() async {
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    await _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
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

  @override
  void photoTapButton() {
    if (_controller != null) {
      if (_controller!.value.isInitialized) {
        debugPrint("Yes is ready");
      } else {
        debugPrint("No it is NOT YEAT ready");
      }
    }
  }

  @override
  Widget cameraLayer() {
    if (_controller != null) {
      if (_controller!.value.isInitialized) {
        return AspectRatio(
            aspectRatio:
                _controller!.value.aspectRatio / sizeOfScreen().aspectRatio,
            child: CameraPreview(_controller!));
      } else {
        return const Center();
      }
    } else {
      return const Center();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("RESUMED");
        _cameraInitializer(_controller?.description);
        break;
      case AppLifecycleState.inactive:
        debugPrint("INACTIVE");
        _controller?.dispose();
        break;
      default:
    }
    // super.didChangeAppLifecycleState(state);
  }

  Future<void> _cameraInitializer(CameraDescription? description) async {
    _controller = CameraController(description!, ResolutionPreset.max);
    await _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
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
