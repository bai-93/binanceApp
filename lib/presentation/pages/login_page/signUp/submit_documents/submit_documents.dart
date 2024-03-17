import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/pages/login_page/signUp/submit_documents/submit_documents_content.dart';
import 'package:sheker/uicomponent/verification_step.dart';
import 'package:sheker/utilities/app_colors.dart';

class SubmitDocuments extends BaseScreen {
  const SubmitDocuments({super.key});

  @override
  State<SubmitDocuments> createState() => _SubmitDocumentsState();
}

class _SubmitDocumentsState extends BaseScreenState<SubmitDocuments>
    with BaseScreenMixin {
  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.lightBackground,
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
            'Submit documents',
            style: TextStyle(color: AppColors.text, fontSize: 32.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 18.0),
          child: Text(
            'We are required by law to verify your identity by collecting your ID and selfie',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, color: AppColors.text),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter your location',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.text, fontSize: 14.0),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const SubmitDocumentsContent()
      ],
    );
  }
}
