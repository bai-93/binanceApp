import 'package:hive/hive.dart';
import 'package:sheker/domain/entities/user_hive.dart';

class RouterPathManager {
  static String _path = '/home';

  static String getRouterPath() {
    Box<UserHive> userHive = Hive.box('userBox');
    return '';
  }
}
