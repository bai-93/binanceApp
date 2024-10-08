import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';
import 'package:flutter/material.dart';

class GraphViewModel {
  Offset _globalPoints = Offset.zero;
  double _currentPrice = 0.0;
  double _currentPercent = 0.0;
  int _coinButtonIndex = 0;
  int _titlesDaysIndex = 0;

  final List<String> _imagesCoin = ['ETH', 'BTC', 'SOL', 'XRP', 'ADA'];
  final List<String> _coinLabelTitles = [
    'ETH/USD',
    'BTC/USD',
    'SOL/USD',
    'XRP/USD',
    'ADA/USD'
  ];
  final List<String> _titlesOfDates = ['1Hour', '1Day', '1Month', '1Year'];
  final List<String> _datesOfQuery = ['h1', 'd1', 'm1', 'm15'];
  final List<String> _coinNames = [
    'Ethereum',
    'Bitcoin',
    'Solana',
    'Ripple',
    'Cardano'
  ];

  void setIndex(int index) {
    _coinButtonIndex = index;
  }

  void setDaysIndex(int index) {
    _titlesDaysIndex = index;
  }

  int getCurrentIndex() {
    return _coinButtonIndex;
  }

  int getCurrentDateIndex() {
    return _titlesDaysIndex;
  }

  List<String> getTitlesOfDates() {
    return _titlesOfDates;
  }

  List<String> getCoinLabels() {
    return _coinLabelTitles;
  }

  String getImage() {
    String imagePath = 'lib/images/coin/${_imagesCoin[_coinButtonIndex]}.png';
    return imagePath;
  }

  String getCoinFullName() {
    return _coinNames[_coinButtonIndex];
  }

  String getCoinQuery() {
    return _coinNames[_coinButtonIndex].toLowerCase();
  }

  String getCoinSymbolName() {
    return _imagesCoin[_coinButtonIndex];
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

  String getDayQuery() {
    return _datesOfQuery[_titlesDaysIndex];
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
    _globalPoints = input;
  }

  Offset getGlobalPoints() {
    return _globalPoints;
  }
}
