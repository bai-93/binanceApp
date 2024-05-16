import 'package:flutter/material.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/pages/login_page/create_password/password_content.dart';
import 'package:sheker/utilities/app_colors.dart';

class CreatePassword extends BaseScreen {
  String path;
  CreatePassword(this.path, {super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends BaseScreenState<CreatePassword>
    with BaseScreenMixin {
  @override
  bool isActiveBottomSocialApp() {
    return true;
  }

  @override
  Widget bottomSocialApp({onPress? facebook, onPress? apple, onPress? google}) {
    return super.bottomSocialApp(
      facebook: () {
        debugPrint('facebook');
      },
      apple: () {
        debugPrint('apple');
      },
      google: () {
        debugPrint('google');
      },
    );
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
      backgroundColor: AppColorsUtility.lightBackground,
      title: VerificationStep(
        0.0,
        0.24,
      ),
    );
  }

  @override
  Widget body() {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Create a password',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(color: AppColorsUtility.text, fontSize: 32.0),
            )),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 15.0),
          child: Text(
            'The password must be 8 characters, including 1 uppercase letter, 1 number and 1 special character.',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColorsUtility.text, fontSize: 14.0),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        PasswordContentField(widget.path),
        const SizedBox(height: 42.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 15.0),
          child: Text(
            'By registering you accept our Terms & Conditions and Privacy Policy. Your data will be security encrypted with TLS',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColorsUtility.text),
          ),
        ),
        const SizedBox(
          height: 70.0,
        )
      ],
    );
  }
}
