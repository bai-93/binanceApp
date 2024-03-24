import 'package:hive/hive.dart';

part 'portfolio_hive.g.dart';

@HiveType(typeId: 1)
class PortfolioHive extends HiveObject {
  @HiveField(0)
  late List<Coin> cryptoData;
}

class Coin {
  late String name;
  late String symbol;
  late String price;
  late String percent;

  Coin({this.name = '', this.symbol = '', this.price = '', this.percent = ''});
}
