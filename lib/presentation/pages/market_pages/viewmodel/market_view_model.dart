import 'package:sheker/domain/entities/favorites_hive.dart';
import 'package:sheker/domain/entities/hive_services/favorites_service_hive.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/utilities/money_formatter.dart';

class MarketViewModel {
  List<String> _historyOfSearch = [];

  void clear() {
    _historyOfSearch.clear();
  }

  void addToHistory(String input) {
    if (!_historyOfSearch.contains(input)) {
      _historyOfSearch.insert(0, input);
    }
  }

  List<String> getHistoryData() {
    return _historyOfSearch;
  }

  void addToDataBase(CryptoModel inputModel) {
    double changePercent24Hr = double.parse(
        MoneyFormatterUtility.moneyFormatCount(
            double.parse(inputModel.changePercent24Hr ?? '0'),
            count: 2));
    double priceUsd = double.parse(MoneyFormatterUtility.moneyFormatCount(
        double.parse(inputModel.priceUsd ?? '0.0')));
    double volume24h = double.parse(MoneyFormatterUtility.moneyFormatCount(
        double.parse(inputModel.volumeUsd24Hr ?? '0.0'),
        count: 2));
    FavoritesHive object = FavoritesHive(
        symbol: inputModel.symbol,
        name: inputModel.name,
        percent24h: changePercent24Hr,
        topPrice: priceUsd,
        volume24h: volume24h);
    if (_hasTheSameData(object)) {
    } else {
      FavoritesServiceHive.addData(object);
    }
  }

  bool _hasTheSameData(FavoritesHive inputData) {
    bool flag = false;
    for (var data in FavoritesServiceHive.favoritesDataBase!.values) {
      if (data.symbol == inputData.symbol) {
        flag = true;
        break;
      } else {
        flag = false;
      }
    }
    return flag;
  }
}
