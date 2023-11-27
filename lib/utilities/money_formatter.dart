import 'package:intl/intl.dart';

class MoneyFormatter {
  static String dollarFormat(String? input, {bool isSecured = false}) {
    NumberFormat format =
        NumberFormat.decimalPatternDigits(locale: 'en_us', decimalDigits: 2);
    double money = double.parse(input ?? '0.0');
    String output = isSecured
        ? format.format(money).replaceAll(RegExp('[0-9]'), '*')
        : format.format(money);
    return "$output \$";
  }
}
