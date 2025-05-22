import 'package:intl/intl.dart';

class DateHelper {
  static bool isValidRange(DateTime start, DateTime end) {
    var nStart = start;
    var nEnd = end;
    if (start.isAfter(end)) {
      final temp = nStart;
      nStart = nEnd;
      nEnd = temp;
    }
    return nEnd.difference(nStart).inDays >= 7;
  }

  static String format(DateTime date) => DateFormat('dd-MM-yyyy').format(date);

  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }
}
