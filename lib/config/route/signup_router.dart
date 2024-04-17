import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/login_page/create_password/create_password.dart';
import 'package:sheker/presentation/pages/login_page/login.dart';
import 'package:sheker/presentation/pages/login_page/password_reset/password_reset.dart';
import 'package:sheker/presentation/pages/login_page/signUp/account_creation_verification.dart';
import 'package:sheker/presentation/pages/login_page/signUp/add_mail.dart';
import 'package:sheker/presentation/pages/login_page/signUp/letter_send.dart';
import 'package:sheker/presentation/pages/login_page/signUp/otp/otp.dart';
import 'package:sheker/presentation/pages/login_page/signUp/registration_verification/successfull_registration.dart';
import 'package:sheker/presentation/pages/login_page/signUp/registration_verification/successfull_verification.dart';
import 'package:sheker/presentation/pages/login_page/signUp/scan_documents/scan_documents.dart';
import 'package:sheker/presentation/pages/login_page/signUp/scan_documents/selfie_verification/selfie_verification.dart';
import 'package:sheker/presentation/pages/login_page/signUp/scan_documents/take_photo_verification/passport_photo_verification.dart';
import 'package:sheker/presentation/pages/login_page/signUp/submit_documents/submit_documents.dart';
import 'package:sheker/presentation/pages/login_page/signUp/welcome.dart';

final class SignupRouter {
  static bool _isResetPassword = false;
  static GoRoute router = GoRoute(
      path: '/sign_up',
      builder: (context, state) {
        return SignUpWelcomeScreen();
      },
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) {
            return const Login();
          },
        ),
        GoRoute(
          path: 'password_reset',
          onExit: (context) {
            _isResetPassword = false;
            return true;
          },
          builder: (context, state) {
            _isResetPassword = true;
            return const PasswordReset();
          },
        ),
        GoRoute(
          path: 'account_verification',
          builder: (context, state) {
            return SignUpAccountCreationVerification();
          },
        ),
        GoRoute(
          path: 'add_mail',
          builder: (context, state) {
            return const SignUpAddMail();
          },
        ),
        GoRoute(
          path: 'letter_send',
          builder: (context, state) {
            return LetterSend(
              state.extra as String,
            );
          },
        ),
        GoRoute(
          path: 'otp',
          builder: (context, state) {
            return Otp(state.extra! as String);
          },
        ),
        GoRoute(
          path: 'create_password',
          builder: (context, state) {
            return CreatePassword(_isResetPassword
                ? '/sign_up/success_registration'
                : '/sign_up/submit_documents');
          },
        ),
        GoRoute(
          path: 'submit_documents',
          builder: (context, state) {
            return const SubmitDocuments();
          },
        ),
        GoRoute(
          path: 'scan_documents',
          builder: (context, state) {
            return const ScanDocuments();
          },
        ),
        GoRoute(
          path: 'take_photo_verification',
          builder: (context, state) {
            final flag = state.extra! as bool;
            return PassportPhotoVerification(flag);
          },
        ),
        GoRoute(
          path: 'selfie_verfication',
          builder: (context, state) {
            return const SelfieVerification();
          },
        ),
        GoRoute(
          path: 'success_verification',
          builder: (context, state) {
            return const SuccessVerification();
          },
        ),
        GoRoute(
          path: 'success_registration',
          builder: (context, state) {
            return const SuccessfullRegistration();
          },
        )
      ]);
}
