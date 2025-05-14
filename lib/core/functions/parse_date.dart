import 'package:intl/intl.dart';

abstract class ParseDate {
  static String formatDate(String dateStr) {
    try {
      final dateTime = DateTime.parse(dateStr);
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } catch (e) {
      return dateStr;
    }
  }
}
