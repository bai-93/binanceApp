import 'package:hive/hive.dart';

part 'favorites_hive.g.dart';

@HiveType(typeId: 2)
class FavoritesHive extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late double volume24h;
  @HiveField(2)
  late double topPrice;
  @HiveField(3)
  late double lowPrice;
  @HiveField(4)
  late double lastPrice;
  @HiveField(5)
  late double percent24h;

  FavoritesHive(
      {this.name = '',
      this.volume24h = 0.0,
      this.topPrice = 0.0,
      this.lowPrice = 0.0,
      this.lastPrice = 0.0,
      this.percent24h = 0.0});
}
