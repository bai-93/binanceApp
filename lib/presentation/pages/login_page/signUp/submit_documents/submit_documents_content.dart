import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/utilities/app_colors.dart';

class SubmitDocumentsContent extends StatefulWidget {
  const SubmitDocumentsContent({super.key});

  @override
  State<SubmitDocumentsContent> createState() => _SubmitDocumentsContentState();
}

class _SubmitDocumentsContentState extends State<SubmitDocumentsContent> {
  bool idCardFlag = false, passportFlag = false, licenseFlag = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.internalShadow,
                      blurRadius: 4.0,
                      offset: const Offset(0.0, 3.0))
                ],
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: ExpansionTile(
              leading: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Image.asset('lib/images/login/signup/flag_ukraine.png'),
              ),
              trailing: SizedBox(
                width: 20.0,
                height: 20.0,
                child: Image.asset('lib/images/login/signup/down.png'),
              ),
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              title: Row(
                children: [
                  Container(
                    width: 1.0,
                    height: 30.0,
                    color: AppColors.otline,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Ukraine',
                    style: TextStyle(color: AppColors.text, fontSize: 16.0),
                  ),
                ],
              ),
              onExpansionChanged: (value) {
                debugPrint(" tapped  $value");
              },
              children: [
                Container(
                  height: 50.0,
                  width: 100.0,
                  color: AppColors.onboardingPrimary,
                  child: Text(
                    'country',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.surface),
                  ),
                ),
                Container(
                    height: 50.0,
                    width: 100.0,
                    color: AppColors.secondary,
                    child: Text(
                      'country',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.surface),
                    )),
                Container(
                    height: 50.0,
                    width: 100.0,
                    color: AppColors.text,
                    child: Text(
                      'country',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.surface),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          makeVerificationContent('National ID Card', 'idcard.png', idCardFlag,
              () {
            setState(() {
              idCardFlag = !idCardFlag;
            });
          }),
          const SizedBox(
            height: 16.0,
          ),
          makeVerificationContent(
              'Passport', 'passport_biometric.png', passportFlag, () {
            setState(() {
              passportFlag = !passportFlag;
            });
          }),
          const SizedBox(
            height: 16.0,
          ),
          makeVerificationContent('Driver license', 'license.png', licenseFlag,
              () {
            setState(() {
              licenseFlag = !licenseFlag;
            });
          }),
          const SizedBox(
            height: 80.0,
          ),
          SizedBox(
            height: 48.0,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: idCardFlag || passportFlag || licenseFlag
                    ? () {
                        context.go('/sign_up/scan_documents');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: idCardFlag || passportFlag || licenseFlag
                        ? AppColors.onboardingPrimary
                        : AppColors.otline,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)))),
                child: Text('Continue',
                    style: TextStyle(
                        color: idCardFlag || passportFlag || licenseFlag
                            ? AppColors.surface
                            : AppColors.secondary))),
          ),
          const SizedBox(height: 98)
        ],
      ),
    );
  }

  Widget makeVerificationContent(
      String title, String nameOfImage, bool flag, void Function() action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: MediaQuery.of(context).size.width - 32.0,
        height: 68.0,
        decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [
              BoxShadow(
                  color: AppColors.internalShadow,
                  blurRadius: 4.0,
                  offset: const Offset(0.0, 3.0))
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
        child: Center(
          child: Row(
            children: [
              const SizedBox(
                width: 14.0,
              ),
              SizedBox(
                height: 33.0,
                width: 27.0,
                child: Image.asset(
                  'lib/images/login/signup/$nameOfImage',
                  color: flag ? AppColors.onboardingPrimary : null,
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                color: AppColors.otline,
                width: 1.0,
                height: 30.0,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: AppColors.text, fontSize: 16.0),
              ),
              const Spacer(),
              Stack(
                children: [
                  Container(
                    width: 18.0,
                    height: 18.0,
                    decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9.0)),
                        border: Border.all(
                            color: AppColors.onboardingPrimary, width: 2.0)),
                  ),
                  Positioned(
                    left: 3.0,
                    top: 3.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                          color: flag
                              ? AppColors.onboardingPrimary
                              : AppColors.surface,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 14.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
