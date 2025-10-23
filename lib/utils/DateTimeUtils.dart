import 'package:intl/intl.dart';

class DateTimeUtils {
  // Format thời gian kiểu 9:30 AM
  static String formatTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat.jm().format(dateTime);
  }

  //Format ngày kiểu: Tháng đầy đủ, thứ, ngày
  static String formatDate(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat('MMMM  EEEE d').format(dateTime);
  }

  // Format ngày + giờ kiểu: Aug 20, 9:30 AM
  static String formatDateTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat('MMM d, h:mm a').format(dateTime);
  }

  // Format thời gian kiểu 24h có giây: 21:30:45
  static String formatTime24h(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat.Hms().format(dateTime);
  }

  // Format ngày kiểu dd/MM (ví dụ: 10/03)
  static String formatDayMonth(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat('dd/MM').format(dateTime);
  }
}
