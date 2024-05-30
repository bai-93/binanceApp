class CoinModel {
  int _index = 0;

  final List<String> _socketCoinsData = [
    "ETH-USD",
    "BTC-USD",
    "SOL-USD",
    "XRP-USD",
    "ADA-USD"
  ];

  final List<String> _titleCoinsUSDdata = [
    "ETH/USD",
    "BTC/USD",
    "SOL/USD",
    "XRP/USD",
    "ADA/USD"
  ];

  String getCurrentTitleCoinUSD() {
    return _titleCoinsUSDdata[_index];
  }

  List<String> getAllTitlesCoinUSD() {
    return _titleCoinsUSDdata;
  }

  String getCurrentSocketCoin() {
    return _socketCoinsData[_index];
  }

  void setIndex(int index) {
    _index = index;
  }

  int getCurrentIndex() {
    return _index;
  }
}
