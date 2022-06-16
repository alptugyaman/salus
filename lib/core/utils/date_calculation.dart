import 'package:intl/intl.dart';

class DateCalculation {
  static String howLongDate(String date) {
    DateTime _now = DateTime.now();
    DateTime _midnight = DateTime(_now.year, _now.month, _now.day);
    DateTime _toDate = DateTime.parse(date);
    DateTime _date = DateTime(_toDate.year, _toDate.month, _toDate.day);

    int difference = _midnight.difference(_date).inDays;

    if (difference < 1) return 'Bugün';
    if (difference >= 1 && difference < 2) return 'Dün';
    return DateFormat('dd/MM/yyyy').format(_toDate);
  }

  static String? convertingToString(DateTime date) {
    return date.toString();
  }

  static String? getHour(String date) {
    DateTime _date = DateTime.parse(date);
    String? hour = DateFormat.Hm().format(_date);
    return hour;
  }
}
