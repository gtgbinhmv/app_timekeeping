import 'package:app_timekeeping/utils/time_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shiftInfoProvider = StreamProvider<ShiftInfo>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) {
    return WorkShiftHelper.getCurrentShiftInfo();
  });
});
