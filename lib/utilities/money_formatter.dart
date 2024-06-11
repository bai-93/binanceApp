import 'package:intl/intl.dart';

class MoneyFormatterUtility {
  static String dollarFormat(String? input, {bool isSecured = false}) {
    NumberFormat format =
        NumberFormat.decimalPatternDigits(locale: 'en_us', decimalDigits: 2);
    double money = double.parse(input ?? '0.0');
    String output = isSecured
        ? format.format(money).replaceAll(RegExp('[0-9]'), '*')
        : format.format(money);
    return "$output \$";
  }

  static String moneyFormatOneComma(String? input) {
    NumberFormat format =
        NumberFormat.decimalPatternDigits(locale: 'en_us', decimalDigits: 2);
    double money = double.parse(input ?? '0.0');
    String output = format.format(money);
    return output.replaceAll(',', ' ').replaceAll('.', ',');
  }

  static String moneyFormatShort(double input) {
    return input.toStringAsFixed(2);
  }

  static String moneyFormatCount(double input, {int count = 5}) {
    return input.toStringAsFixed(count);
  }
}
