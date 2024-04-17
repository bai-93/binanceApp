import 'package:sheker/domain/entities/hive_services/hive_service.dart';
import 'package:sheker/domain/entities/portfolio_hive.dart';
import 'package:sheker/injection/injection_configure.dart';

class PortolioServiceHive {
  static var portfolioDataBase = getIt<MainHiveService>().portfolio;

  static Future<void> clearAllData() async {
    await portfolioDataBase?.clear();
  }

  static Future<void> deleteSpecificData(int index) async {
    portfolioDataBase?.getAt(0)?.cryptoData.removeAt(index);
  }

  static Future<void> addDataToPortfolio(Coin data) async {
    portfolioDataBase?.getAt(0)?.cryptoData.add(data);
  }
}
