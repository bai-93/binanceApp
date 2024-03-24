import 'package:hive/hive.dart';
import 'package:sheker/domain/entities/favorites_hive.dart';
import 'package:sheker/domain/entities/portfolio_hive.dart';
import 'package:sheker/domain/entities/user_hive.dart';

class HiveSettings {
  static Future<void> registerAdapters() async {
    Hive.registerAdapter(UserHiveAdapter());
    Hive.registerAdapter(FavoritesHiveAdapter());
    Hive.registerAdapter(PortfolioHiveAdapter());
  }

  static Future<void> openAllBox() async {
    await Hive.openBox<UserHive>('userBox');
    await Hive.openBox<FavoritesHive>('favoritesBox');
    await Hive.openBox<PortfolioHive>('portfolioBox');
  }
}
