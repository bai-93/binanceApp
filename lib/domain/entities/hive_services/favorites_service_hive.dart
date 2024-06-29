import 'package:sheker/domain/entities/favorites_hive.dart';
import 'package:sheker/domain/entities/hive_services/hive_service.dart';
import 'package:sheker/injection/injection_configure.dart';

class FavoritesServiceHive {
  static var favoritesDataBase = getIt<MainHiveService>().favorites;

  static Future<void> clearAllData() async {
    await favoritesDataBase?.clear();
  }

  static Future<void> addData(FavoritesHive data) async {
    await favoritesDataBase?.add(data);
  }

  static Future<void> removeData(int index) async {
    await favoritesDataBase?.deleteAt(index);
  }

  static FavoritesHive? getDataByIndex(int index) {
    return favoritesDataBase?.getAt(index);
  }
}
