import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_verification/base_verification_camera.dart';
import 'package:sheker/presentation/pages/login_page/signUp/registration_verification/base_registration_verification.dart';

class SuccessfullRegistration extends BaseScreen {
  const SuccessfullRegistration({super.key});

  @override
  State<SuccessfullRegistration> createState() =>
      _SuccessfullRegistrationState();
}

class _SuccessfullRegistrationState
    extends BaseScreenState<SuccessfullRegistration>
    with BaseRegistrationVerification {
  @override
  String getMainTitle() {
    return 'Congratulations!';
  }

  @override
  String getSubtitle() {
    return 'You have successfully created a new password, click continue to enter the application';
  }

  @override
  String getTitleOfButton() {
    return 'Continue';
  }

  @override
  void onTap() {
    debugPrint("continue success password");
  }
}
