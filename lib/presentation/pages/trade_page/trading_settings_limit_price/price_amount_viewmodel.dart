import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';

class PriceAmountViewModel {
  final List<String> redPrice = [];
  final List<String> redAmount = [];
  final List<String> greenPrice = [];
  final List<String> greenAmount = [];
  final Random _random = Random();

  Function()? readyCallback;

  Color getRedPriceColor() {
    return AppColorsUtility.red;
  }

  Color getGreenPriceColor() {
    return AppColorsUtility.green;
  }

  void addData(String item) {
    if (item.isNotEmpty) {
      double price = double.parse(item);
      _dataGenerate(price, redPrice);
      _dataGenerate(0, redAmount, flag: true);
      _dataGenerate(price, greenPrice, flag: false);
      _dataGenerate(0, greenAmount, flag: true);
      readyCallback?.call();
    } else {
      debugPrint("empty");
    }
  }

  void _dataGenerate(double price, List<String> dataCollection,
      {bool flag = false}) {
    dataCollection.clear();
    for (int i = 0; i < 10; i++) {
      double generatedValue = _generateNumber(price, isAmount: flag);
      String formatedValue =
          MoneyFormatterUtility.moneyFormatShort(generatedValue);
      dataCollection.add(formatedValue);
    }
  }

  double _generateNumber(double price, {bool isAmount = false}) {
    if (isAmount) {
      return _random.nextDouble() * 1 * 12.34582;
    } else {
      return _random.nextDouble() + 1 * price;
    }
  }

  List<String> getRandomPartOfString(String input) {
    String firstPart = "", secondPart = "";
    int maxLength = input.length;
    int startIndex = _random.nextInt(maxLength);
    if (maxLength == startIndex) {
      return [input, ""];
    } else {
      firstPart = input.replaceRange(startIndex, null, '');
      secondPart = input.substring(startIndex, maxLength);
      return [firstPart, secondPart];
    }
  }
}
