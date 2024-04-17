import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/domain/entities/hive_services/user_service_hive.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/presentation/pages/login_page/signUp/registration_verification/base_registration_verification.dart';

class SuccessVerification extends BaseScreen {
  const SuccessVerification({super.key});

  @override
  State<SuccessVerification> createState() => _SuccessVerificationState();
}

class _SuccessVerificationState extends BaseScreenState<SuccessVerification>
    with BaseRegistrationVerification {
  @override
  String getMainTitle() {
    return 'Verification Success';
  }

  @override
  String getSubtitle() {
    return 'Congratulations your account is ready to use, now you can start trading cryptocurrency';
  }

  @override
  String getTitleOfButton() {
    return 'Start Now';
  }

  @override
  void onTap() {
    UserServiceHive.setRegisterFlag(true);
    print(UserServiceHive.getIsRegistered());
    context.go('/home');
  }

  @override
  AppBar progressOfAppBar({double from = 0, double to = 0}) {
    return super.progressOfAppBar(from: 0.8, to: 1.0);
  }
}
