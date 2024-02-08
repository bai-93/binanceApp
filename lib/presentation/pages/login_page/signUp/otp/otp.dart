import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/component/verification_step.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/bloc/sign_up/bloc/otp_bloc.dart';
import 'package:sheker/presentation/pages/login_page/signUp/otp/otp_image_animation.dart';
import 'package:sheker/presentation/pages/login_page/signUp/otp/otp_password.dart';
import 'package:sheker/utilities/app_colors.dart';

class Otp extends BaseScreen {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends BaseScreenState<Otp> with BaseScreenMixin {
  @override
  void initState() {
    super.initState();
    context.read<OtpBloc>().add(OtpSendEvent());
  }

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
        0.0,
        0.41,
      ),
    );
  }

  @override
  bool isActiveBottomSocialApp() {
    return true;
  }

  @override
  Widget bottomSocialApp({onPress? facebook, onPress? apple, onPress? google}) {
    return super.bottomSocialApp(facebook: () {
      debugPrint("facebook");
    }, apple: () {
      debugPrint("apple");
    }, google: () {
      debugPrint("google");
    });
  }

  @override
  Widget body() {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          Text(
            'Please enter the code',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.text, fontSize: 32.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'We sent email to tomashuk.dima.1992@gmail.com',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.text, fontSize: 14.0),
          ),
          const SizedBox(height: 46.0),
          const OtpImageAnimation(),
          const SizedBox(
            height: 24.0,
          ),
          const OtpPasswordFields()
        ],
      ),
    );
  }
}
