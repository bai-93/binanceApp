import 'dart:math';
import 'package:sheker/utilities/date_format.dart';
import 'package:sheker/utilities/money_formatter.dart';

class GraphCoinViewModel {
  final Random _random = Random();

  GraphCoinViewModel();

  List<_PriceAmountTime> generateNumber(double inputPrice, int inputLength) {
    if (inputLength == 0) {
      return [];
    } else {
      List<_PriceAmountTime> data = [];
      for (int i = 0; i < inputLength; i++) {
        bool flag = _random.nextBool();
        double price = _random.nextDouble() + 1 * inputPrice;
        double amount = _random.nextDouble() * 1 * 12.34582;
        String time = DateFormatUtility.getCurrentTime();

        data.add(_PriceAmountTime(
            flag,
            MoneyFormatterUtility.moneyFormatShort(price),
            MoneyFormatterUtility.moneyFormatCount(amount),
            time));
      }
      return data;
    }
  }

  List<String> getRandomPartOfString(String input) {
    String firstPart = '', secondPart = '';
    int maxLength = input.length;
    int startIndex = _random.nextInt(maxLength);
    if (maxLength == startIndex) {
      return [input, ''];
    } else {
      firstPart = input.replaceRange(startIndex, null, '');
      secondPart = input.substring(startIndex, maxLength);
      return [firstPart, secondPart];
    }
  }
}

class _PriceAmountTime {
  bool isGreen;
  String price, amount;
  String time;
  _PriceAmountTime(this.isGreen, this.price, this.amount, this.time);
}
