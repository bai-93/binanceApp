import 'package:intl/intl.dart';

class DateFormatUtility {
  static String getCurrentFormat({bool haveOwn = false, String date = ''}) {
    if (haveOwn) {
      //not developed yet
      return '';
    } else {
      DateTime dateFormat = DateTime.now();
      String output =
          '${dateFormat.year}/${dateFormat.month}/${dateFormat.day} ${dateFormat.hour}:${dateFormat.minute}:${dateFormat.second}';
      return output;
    }
  }

  static String getCurrentTime() {
    DateTime dateTime = DateTime.now();
    String output = '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    return output;
  }
}
