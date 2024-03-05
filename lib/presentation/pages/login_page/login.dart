import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/biometryhelper.dart';
import 'package:sheker/utilities/regex_pattern.dart';

class Login extends BaseScreen {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends BaseScreenState<Login> with BaseScreenMixin {
  bool isActiveBiometry = false;
  bool isActiveButton = false;
  bool isActiveSecure = false;
  String biometryTitle = '';
  final ValueNotifier<int> count = ValueNotifier(0);
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  bool isActiveBottomSocialApp() {
    return true;
  }

  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.signUp);
  }

  @override
  void initState() {
    count.addListener(() {
      validationCheck();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    count.dispose();
    super.dispose();
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
          'Login to your\nAccount',
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.text, fontSize: 32.0),
        ),
        const SizedBox(
          height: 16.0,
        ),
        makeTextField(_controllerEmail, false, true, () {
          setState(() {});
        }),
        const SizedBox(
          height: 16.0,
        ),
        makeTextField(_controllerPassword, isActiveSecure, false, () {
          setState(() {
            isActiveSecure = !isActiveSecure;
          });
        }),
        const SizedBox(
          height: 16.0,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Forgot your password? ',
                style: TextStyle(fontSize: 14.0, color: AppColors.text),
                children: [
                  TextSpan(
                      text: 'Click here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint("Click here tapped");
                        },
                      style: TextStyle(
                          color: AppColors.onboardingPrimary, fontSize: 14.0))
                ])),
        const SizedBox(
          height: 18.0,
        ),
        FutureBuilder<String>(
            future: BiometryHelper(context).getTitleAvailableBiometryType(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 14.0,
                        ),
                        Text('Unlock with ${snapshot.data!}'),
                        const Spacer(),
                        Switch.adaptive(
                            value: isActiveBiometry,
                            splashRadius: 0.0,
                            activeColor: AppColors.onboardingPrimary,
                            onChanged: (value) {
                              setState(() {
                                isActiveBiometry = value;
                              });
                            }),
                        const SizedBox(
                          width: 14.0,
                        )
                      ],
                    )
                  : const Center();
            }),
        const SizedBox(
          height: 19.0,
        ),
        makeButton(isActiveButton, () {
          debugPrint("sign in");
        }),
        const SizedBox(
          height: 100.0,
        )
      ]),
    );
  }

  Widget makeButton(bool flag, void Function() callback) {
    return ElevatedButton(
        onPressed: flag ? callback : null,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(sizeOfScreen().width, 48.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            backgroundColor:
                flag ? AppColors.onboardingPrimary : AppColors.otline),
        child: Text(
          'Sign in',
          style: TextStyle(
              color: flag ? AppColors.surface : AppColors.secondary,
              fontSize: 16.0),
        ));
  }

  void validationCheck() {
    if (RegexPattern.emailValidator(_controllerEmail.text) &&
        _controllerPassword.text.isNotEmpty) {
      setState(() {
        isActiveButton = true;
      });
    } else {
      setState(() {
        isActiveButton = false;
      });
    }
  }

  Widget makeTextField(
    TextEditingController controller,
    bool isActiveSecured,
    bool isEmailStyle,
    void Function() callback,
  ) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(
              color: isActiveButton
                  ? AppColors.onboardingPrimary
                  : AppColors.internalShadow),
          boxShadow: [
            BoxShadow(
                color: AppColors.internalShadow,
                blurRadius: 2.0,
                offset: const Offset(0.0, -0.9))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: TextFormField(
        onChanged: (value) {
          count.value++;
        },
        obscureText: isActiveSecured,
        obscuringCharacter: '*',
        maxLength: isEmailStyle ? null : 8,
        controller: controller,
        style: TextStyle(color: AppColors.text),
        decoration: InputDecoration(
            counterText: '',
            prefixIcon: isEmailStyle
                ? Image.asset(
                    'lib/images/login/signup/mail_signup.png',
                    width: 24.0,
                    height: 24.0,
                  )
                : Image.asset('lib/images/login/signup/lock_light.png'),
            isDense: false,
            border: InputBorder.none,
            hintText: isEmailStyle ? "Email address" : 'Password',
            hintStyle: TextStyle(fontSize: 16.0, color: AppColors.otline),
            suffixIcon: isEmailStyle
                ? null
                : IconButton(
                    onPressed: callback,
                    icon: Image.asset(
                      'lib/images/login/signup/view_light.png',
                      color: isActiveSecured ? Colors.green : null,
                    ))),
      ),
    );
  }
}
