import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/utilities/money_formatter.dart';

class WalletAssetsFilteredModel {
  late CryptoModelList data;
  List<CryptoModel> filteredCoins = [];
  List<String> coinTitles = [
    'ADA',
    'ATOM',
    'BTC',
    'CRO',
    'DOGE',
    'ETH',
    'LTC',
    'SOL',
    'UNI',
    'USDT'
  ];

  void passData(CryptoModelList input) {
    data = input;
    _filterData();
  }

  void _filterData() {
    for (var element in data.data) {
      if (coinTitles.contains(element.symbol)) {
        filteredCoins.add(element);
      }
    }
  }

  String getImagePath(int index) {
    return 'lib/images/coin/${filteredCoins[index].symbol}.png';
  }

  String formateValues(String input) {
    return  MoneyFormatterUtility.moneyFormatCount(double.parse(input),
        count: 2);
  }

  bool isGreaterOrEqualToZero(String input) {
    double value = double.parse(input);
    return value >= 0.0 ? true : false;
  }
}
