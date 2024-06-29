import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:sheker/domain/entities/favorites_hive.dart';
import 'package:sheker/domain/entities/portfolio_hive.dart';
import 'package:sheker/domain/entities/user_hive.dart';

abstract class HiveServiceDefinition {}

mixin HiveServiceMainMixin on HiveServiceDefinition {
  Box<UserHive>? user;
  Box<FavoritesHive>? favorites;
  Box<PortfolioHive>? portfolio;

  Future<void> registerAdapters() async {
    Hive.registerAdapter(UserHiveAdapter());
    Hive.registerAdapter(FavoritesHiveAdapter());
    Hive.registerAdapter(PortfolioHiveAdapter());
    await _openAllBox();
  }

  Future<void> _openAllBox() async {
    user = await Hive.openBox<UserHive>((UserHive).toString());
    favorites = await Hive.openBox<FavoritesHive>((FavoritesHive).toString());
    portfolio = await Hive.openBox<PortfolioHive>((PortfolioHive).toString());

    if (user!.isEmpty) {
      print("is empty");
      await user?.add(UserHive());
    }
  }

  Future<void> closeBox() async {
    await Hive.close();
  }
}

@singleton
final class MainHiveService extends HiveServiceDefinition
    with HiveServiceMainMixin {
  void clear() async {
    await user?.clear();
    await favorites?.clear();
    await portfolio?.clear();
    await Hive.close();
  }
}
