import '../../../../domain/models/responses/crypto_models/list_crypto_currencies_model.dart';

class PortfolioModel {
  List<CryptoModel> _data = [];
  List<CryptoModel> _formatedData = [];
  List<String> _acceptableDatas = ["BTC", "ETH", "ATOM", "CRO", "ADA"];

  PortfolioModel({List<CryptoModel>? items}) {
    _data = items ?? [];
    portfolioFilterbyDesign();
  }

  void portfolioFilterbyDesign() {
    if (_data.isNotEmpty) {
      _data.forEach((element) {
        if (_acceptableDatas.contains(element.symbol ?? "")) {
          _formatedData.add(element);
        }
      });
    }
  }

  int getCountOfData() {
    return _formatedData.length;
  }

  List<CryptoModel> getCoinData() {
    return _formatedData;
  }
}
