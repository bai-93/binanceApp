import 'package:sheker/domain/entities/hive_services/user_service_hive.dart';
import 'package:sheker/injection/injection_configure.dart';

class RouterPathManager {
  static String _routerPath = '';
  static bool _inSettings = false;

  static String getRouterPath() {
    if (UserServiceHive.getIsRegistered()) {
      if (_inSettings) {
        _routerPath = '/home/settings';
      } else {
        _routerPath = '/home';
      }
    } else {
      _routerPath = '/onboarding';
    }
    return _routerPath;
  }

  static void setInsideRouter() {
    _routerPath = '/home';
  }

  static void setOutsideRouter() {
    _routerPath = '/onboarding';
  }

  static void setExitRouter() {
    _routerPath = '/onboarding';
  }

  static void isInsideSettings(bool flag) {
    _inSettings = flag;
  }
}
