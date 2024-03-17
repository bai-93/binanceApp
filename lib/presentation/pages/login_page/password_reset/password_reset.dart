import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/utilities/app_colors.dart';

class PasswordReset extends BaseScreen {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends BaseScreenState<PasswordReset>
    with BaseScreenMixin {
  final TextEditingController _controller = TextEditingController();
  bool isActiveButton = false;

  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  bool isActiveBottomSocialApp() {
    return true;
  }

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          isActiveButton = true;
        });
      } else {
        setState(() {
          isActiveButton = false;
        });
      }
    });
    super.initState();
  }

  @override
  AppBar customAppbar() {
    return AppBar(
        leading: BackButton(
          color: AppColors.secondary,
        ),
        backgroundColor: AppColors.lightBackground,
        title: VerificationStep(0.0, 0.001));
  }

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(children: [
        const SizedBox(
          height: 24.0,
        ),
        Text(
          'Password reset',
          style: TextStyle(color: AppColors.text, fontSize: 32.0),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          'Please enter your registered email address to reset your password',
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(color: AppColors.text, fontSize: 14.0),
        ),
        const SizedBox(
          height: 24.0,
        ),
        SizedBox(
          height: 48.0,
          width: sizeOfScreen().width,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.lightBackground,
                border: Border.all(
                    color: isActiveButton
                        ? AppColors.onboardingPrimary
                        : AppColors.otline),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.inner,
                      blurRadius: 1.0,
                      color: AppColors.internalShadow,
                      offset: const Offset(0.0, -1.0))
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: TextStyle(color: AppColors.otline, fontSize: 16.0),
                  isDense: true,
                  counterText: '',
                  border: InputBorder.none,
                  prefixIcon: SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Image.asset(
                          'lib/images/login/signup/mail_signup.png'))),
            ),
          ),
        ),
        const SizedBox(
          height: 154.0,
        ),
        ElevatedButton(
            onPressed: isActiveButton
                ? () {
                    context.push('/sign_up/letter_send',
                        extra: _controller.text);
                  }
                : null,
            style: ElevatedButton.styleFrom(
                fixedSize: Size(sizeOfScreen().width, 48.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                surfaceTintColor: AppColors.lightBackground,
                foregroundColor: AppColors.lightBackground,
                backgroundColor: isActiveButton
                    ? AppColors.onboardingPrimary
                    : AppColors.otline),
            child: Text(
              'Continue',
              style: TextStyle(
                  color:
                      isActiveButton ? AppColors.surface : AppColors.secondary,
                  fontSize: 16.0),
            )),
        const SizedBox(
          height: 42.0,
        ),
        Text(
          'By registering you accept our Terms & Conditions and Privacy Policy. Your data will be security encrypted with TLS',
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.text, fontSize: 12.0),
        ),
        const SizedBox(
          height: 70.0,
        )
      ]),
    );
  }
}
