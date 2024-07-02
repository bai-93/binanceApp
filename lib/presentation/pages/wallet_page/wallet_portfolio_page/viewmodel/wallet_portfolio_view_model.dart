import 'dart:ui';

class WalletPortfolioViewModel {
  final List<Color> _coinsColor = const [
    Color(0xffFFC457),
    Color(0xff1DC198),
    Color(0xff0091C0),
    Color(0xff745DE8),
    Color(0xffFF58A1)
  ];

  final List<String> _coinTitles = const ['BTC', 'ATOM', 'ETH', 'CRO', 'ADA'];

  final List<int> _percents = const [89, 65, 55, 40, 25];

  List<Color> getColors() {
    return _coinsColor;
  }

  int getCounOfColors() {
    return _coinsColor.length;
  }

  List<int> getPercents() {
    return _percents;
  }

  List<String> getCoinsTitle() {
    return _coinTitles;
  }
}
