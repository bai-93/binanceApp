import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';
import 'package:flutter/material.dart';

class GraphViewModel {
  Offset globalPoints = Offset.zero;
  double _currentPrice = 0.0;
  int _currentIndex = 0;
  double _currentPercent = 0.0;
  final List<String> _image = ['ETH', 'BTC', 'SOL', 'XRP', 'ADA'];
  final List<String> _coinNames = [
    'Ethereum',
    'Bitcoin',
    'Solana',
    'Ripple',
    'Cardano'
  ];

  void setIndex(int index) {
    _currentIndex = index;
  }

  int getCurrentIndex() {
    return _currentIndex;
  }

  String getImage() {
    String imagePath = 'lib/images/coin/${_image[_currentIndex]}.png';
    return imagePath;
  }

  String getCoinFullName() {
    return _coinNames[_currentIndex];
  }

  String getCoinSymbolName() {
    return _image[_currentIndex];
  }

  Color getPositiveOrNegativeColor() {
    return _currentPercent >= 0 ? AppColorsUtility.green : AppColorsUtility.red;
  }

  void setCurrentPrice(double price) {
    _currentPrice = price;
  }

  String getCurrentPrice() {
    return MoneyFormatterUtility.dollarFormat(_currentPrice.toString());
  }

  void setCurrentPercent(double percent) {
    _currentPercent = percent;
  }

  String getCurrentPercent() {
    return '${MoneyFormatterUtility.moneyFormatCount(_currentPercent, count: 2)}%';
  }

  List<String> getGraphSettingsImages() {
    String imagePath = 'lib/images/trade/graph';
    return [
      '$imagePath/target_light.png',
      '$imagePath/line_light.png',
      '$imagePath/brush.png',
      '$imagePath/candlestick_light.png',
      '$imagePath/full_alt_light.png'
    ];
  }

  List<String> getGraphSettingsNames() {
    return ['target', 'line', 'brush', 'candlestick', 'full_alt'];
  }

  void setPoints(Offset input) {
    globalPoints = input;
  }

  String getCoinWithLowerCase() {
    return _coinNames[_currentIndex].toLowerCase();
  }
}
