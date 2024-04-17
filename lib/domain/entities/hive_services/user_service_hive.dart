import 'package:sheker/domain/entities/hive_services/hive_service.dart';
import 'package:sheker/injection/injection_configure.dart';

class UserServiceHive {
  static var userDataBase = getIt<MainHiveService>().user?.getAt(0);

  static String getEmail() {
    return userDataBase?.email ?? "";
  }

  static String getIdCardNumber() {
    return userDataBase?.idCardNumber ?? "";
  }

  static bool getIsRegistered() {
    return userDataBase?.isRegistered ?? false;
  }

  static bool getIsDarkTheme() {
    return userDataBase?.isDark ?? false;
  }

  static double getScrollOffset() {
    return userDataBase?.scrollOffset ?? 0.0;
  }

  static Future<void> setEmail(String email) async {
    userDataBase?.email = email;
    await userDataBase?.save();
  }

  static Future<void> setIdCardNumber(String idNumber) async {
    userDataBase?.idCardNumber = idNumber;
    await userDataBase?.save();
  }

  static Future<void> setThemeFlag(bool isDark) async {
    userDataBase?.isDark = isDark;
    await userDataBase?.save();
  }

  static Future<void> setScrollOffset(double offset) async {
    userDataBase?.scrollOffset = offset;
    await userDataBase?.save();
  }

  static Future<void> setRegisterFlag(bool isRegistered) async {
    userDataBase?.isRegistered = isRegistered;
    await userDataBase?.save();
  }
}
