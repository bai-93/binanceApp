import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/utilities/app_colors.dart';

mixin BaseRegistrationVerification<T extends BaseScreen> on BaseScreenState<T> {
  String getTitleOfButton();
  String getMainTitle();
  String getSubtitle();
  void onTap();

  AppBar progressOfAppBar({double from = 0, double to = 0}) {
    return AppBar(
      leading: BackButton(color: AppColors.secondary),
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: VerificationStep(
        from,
        to,
      ),
    );
  }

  Widget bottomButton() {
    return SizedBox(
        height: 48.0,
        width: sizeOfScreen().width - 32.0,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.onboardingPrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)))),
            child: Text(
              getTitleOfButton(),
              style: TextStyle(color: AppColors.surface, fontSize: 16.0),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhiteTheme,
      appBar: progressOfAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Center(
              child: SizedBox(
                height: 287.0,
                width: 322,
                child: Image.asset(
                    'lib/images/login/signup/illustration_verify_reg.png'),
              ),
            ),
            const SizedBox(
              height: 63.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                getMainTitle(),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: AppColors.text, fontSize: 32.0),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17.0),
              child: Text(
                getSubtitle(),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: AppColors.text, fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 56.0,
            ),
            bottomButton(),
            const SizedBox(
              height: 64.0,
            )
          ],
        ),
      ),
    );
  }
}
