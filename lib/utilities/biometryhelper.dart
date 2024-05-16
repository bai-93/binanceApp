import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

typedef callback = void Function();

class BiometryHelperUtility {
  BuildContext _context;
  final LocalAuthentication localAuth = LocalAuthentication();

  BiometryHelperUtility(this._context);

  Future<String> getTitleAvailableBiometryType() async {
    if (_context.mounted) {
      try {
        var available = await localAuth.getAvailableBiometrics();
        switch (available.last) {
          case BiometricType.face:
            return 'Face ID';
          case BiometricType.fingerprint:
            return 'Touch ID';
          case BiometricType.iris:
            return 'Iris';
          case BiometricType.strong:
            return 'Strong';
          case BiometricType.weak:
            return 'Weak';
          default:
            return 'another';
        }
      } on PlatformException catch (e) {
        return "Platform exception while getting title of biometry";
      }
    } else {
      return "Not mounted biometry";
    }
  }

  Future<void> authenticationCheck(
      {callback? successCallback,
      callback? failCallback,
      callback? errorCallback}) async {
    bool isSucessFullAuth = false;
    if (_context.mounted) {
      try {
        if (await localAuth.canCheckBiometrics) {
          isSucessFullAuth = await localAuth.authenticate(
              localizedReason: 'reason of auth CUSTOM MESSAGE',
              options: const AuthenticationOptions(stickyAuth: true));
          if (isSucessFullAuth) {
            successCallback?.call();
          } else {
            failCallback?.call();
          }
        } else {
          errorCallback?.call();
          return;
        }
        successCallback?.call();
        failCallback?.call();
      } on PlatformException catch (e) {
        errorCallback?.call();
      }
    } else {
      errorCallback?.call();
    }
  }
}
