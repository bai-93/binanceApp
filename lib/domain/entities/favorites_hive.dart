import 'package:hive/hive.dart';

part 'favorites_hive.g.dart';

@HiveType(typeId: 2)
class FavoritesHive extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late double volume24h;
  @HiveField(2)
  late double price;
  @HiveField(3)
  late double percent24h;

  FavoritesHive(
      {this.name = '',
      this.volume24h = 0.0,
      this.price = 0.0,
      this.percent24h = 0.0});
}
