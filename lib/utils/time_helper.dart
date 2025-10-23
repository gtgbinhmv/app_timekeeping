import 'package:app_timekeeping/utils/DateTimeUtils.dart';
import 'package:intl/intl.dart';

class WorkShiftHelper {
  static final Map<int, String> weekdayNames = {
    1: 'Thứ 2',
    2: 'Thứ 3',
    3: 'Thứ 4',
    4: 'Thứ 5',
    5: 'Thứ 6',
    6: 'Thứ 7',
    7: 'Chủ nhật',
  };

  static String getWeekdayName(DateTime date) {
    return weekdayNames[date.weekday] ?? '';
  }

  static String formatDayMonth(DateTime date) {
    return DateFormat('dd/MM').format(date);
  }

  static ShiftInfo getCurrentShiftInfo() {
    final dateNow = DateTime.now();
    final weekday = getWeekdayName(dateNow);
    final dateText = 'Hôm nay • $weekday';
    final dateNumber = formatDayMonth(dateNow);
    final currentTime = DateTimeUtils.formatTime24h(dateNow.toIso8601String());

    final isMorningShift = dateNow.hour < 12;
    String shiftTitle = isMorningShift ? "Ca sáng" : "Ca chiều";
    String timeRange = isMorningShift ? "08:00 - 11:00" : "13:00 - 17:00";
    String timeIn = isMorningShift ? "08:00" : "13:00";
    String timeout = isMorningShift ? "11:00" : "17:00";
    // Nếu là Thứ 7 và ca chiều thì giờ làm khác
    if (dateNow.weekday == 6 && !isMorningShift) {
      timeRange = "13:00 - 15:00";
      timeout = "15:00";
    }
    return ShiftInfo(
      dateText: dateText,
      dateNumber: dateNumber,
      currentTime: currentTime,
      shiftTitle: shiftTitle,
      timeRange: timeRange,
      timeIn: timeIn,
      timeOut: timeout,
    );
  }
}

class ShiftInfo {
  final String dateText;
  final String dateNumber;
  final String currentTime;
  final String shiftTitle;
  final String timeRange;
  final String timeIn;
  final String timeOut;

  ShiftInfo({
    required this.dateText,
    required this.dateNumber,
    required this.currentTime,
    required this.shiftTitle,
    required this.timeRange,
    required this.timeIn,
    required this.timeOut,
  });
}
