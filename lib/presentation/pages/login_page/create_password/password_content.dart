import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/regex_pattern.dart';

class PasswordContentField extends StatefulWidget {
  String path;
  PasswordContentField(this.path, {super.key});

  @override
  State<PasswordContentField> createState() => _PasswordContentFieldState();
}

class _PasswordContentFieldState extends State<PasswordContentField> {
  TextEditingController passwordController = TextEditingController();
  final _passwordForm = GlobalKey<FormState>();
  TextEditingController passwordConfirmController = TextEditingController();
  final _confirmForm = GlobalKey<FormState>();
  final ValueNotifier<int> count = ValueNotifier(0);
  bool isActiveButton = false;
  bool isActiveSecuredPassword = false, isActiveSecuredPasswordConfirm = false;
  bool isActiveBiometry = false;
  @override
  void initState() {
    super.initState();
    count.addListener(() {
      validationCheck();
    });
  }

  @override
  void dispose() {
    super.dispose();
    count.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        makeTextField(
            passwordController, _passwordForm, isActiveSecuredPassword, () {
          setState(() {
            isActiveSecuredPassword = !isActiveSecuredPassword;
          });
        }),
        const SizedBox(height: 16.0),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm password',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.0),
              )),
        ),
        const SizedBox(height: 8.0),
        makeTextField(passwordConfirmController, _confirmForm,
            isActiveSecuredPasswordConfirm, () {
          setState(() {
            isActiveSecuredPasswordConfirm = !isActiveSecuredPasswordConfirm;
          });
        }),
        const SizedBox(height: 16.0),
        Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Row(
              children: [
                const SizedBox(width: 14.0),
                Text(
                  'Unlock with Touch ID?',
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: AppColors.text, fontSize: 14),
                ),
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
                const SizedBox(width: 14.0),
              ],
            )),
        const SizedBox(
          height: 19.0,
        ),
        makeButton()
      ],
    );
  }

  void validationCheck() {
    if (passwordController.text.length == 8 &&
        passwordConfirmController.text.length == 8) {
      if ((RegexPattern.passwordValidator(passwordController.text) &&
              RegexPattern.passwordValidator(passwordConfirmController.text)) &&
          passwordConfirmController.text == passwordController.text) {
        setState(() {
          isActiveButton = true;
        });
      }
    } else {
      setState(() {
        isActiveButton = false;
      });
    }
  }

  Widget makeButton() {
    return SizedBox(
      height: 48.0,
      width: MediaQuery.of(context).size.width - 32.0,
      child: ElevatedButton(
        onPressed: isActiveButton
            ? () {
                context.push(widget.path);
              }
            : null,
        child: Text(
          'Continue',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: isActiveButton ? AppColors.surface : AppColors.secondary,
              fontSize: 16.0),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor:
                isActiveButton ? AppColors.onboardingPrimary : AppColors.otline,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ),
    );
  }

  Widget makeTextField(
      TextEditingController controller,
      GlobalKey<FormState> formKey,
      bool isActiveSecured,
      void Function() callback) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 15.0),
        child: Container(
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
            maxLength: 8,
            controller: controller,
            style: TextStyle(color: AppColors.text),
            decoration: InputDecoration(
                counterText: '',
                prefixIcon: Image.asset(
                    'lib/images/login/signup/lock_light.png',
                    color:
                        isActiveSecured ? AppColors.onboardingPrimary : null),
                isDense: false,
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 16.0, color: AppColors.otline),
                suffixIcon: IconButton(
                    onPressed: callback,
                    icon: Image.asset(
                      'lib/images/login/signup/lock_light.png',
                      color: isActiveSecured ? Colors.green : null,
                    ))),
          ),
        ),
      ),
    );
  }
}
