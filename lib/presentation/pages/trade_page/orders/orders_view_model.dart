import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class OrdersViewModel {
  List<String> data = [
    'XRP/USDT',
    'THETA/USDT',
    'BTC/USDT',
    'ADA/USDT',
    'DOGE/USDT'
  ];
  List<String> price = ['0.45', '1.0', '69000.0', '0.47', '0.043'];
  List<String> amount = ['23.0', '10.0', '2.0', '32.0', '40.0'];
  bool _isHide = false;

  void changeHide(bool value) {
    _isHide = value;
  }

  bool getIsHide() {
    return _isHide;
  }

  Color getFilledColor() {
    return _isHide ? AppColorsUtility.onboardingPrimary : Colors.white;
  }
}
