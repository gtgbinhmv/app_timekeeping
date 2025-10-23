import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:app_timekeeping/ui/features/timekeeping/widgets/shift_card.dart';
import 'package:flutter/material.dart';

class TimekeepingCard extends StatelessWidget {
  const TimekeepingCard({
    super.key,
    required this.dateFormat,
    required this.scale,
    required this.dateText,
    required this.dateNumber,
    required this.shiftTitle,
    required this.timeRange,
    required this.currentTime,
  });
  final String dateFormat;
  final double scale;
  final String dateText;
  final String dateNumber;
  final String shiftTitle;
  final String timeRange;
  final String currentTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14 * scale),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.hex7A8A98, width: scale * 1),
        color: AppColor.hexFFFFFF,
        borderRadius: BorderRadius.circular(17 * scale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề ngày
          Row(
            children: [
              Text(
                dateText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontSize: 14 * scale,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                dateNumber,
                style: TextStyle(color: Colors.black54, fontSize: 13 * scale),
              ),
            ],
          ),
          SizedBox(height: 14 * scale),
          // Hoặc Ca hiện tại
          ShiftCard(
            scale: scale,
            title: shiftTitle,
            timeRange: timeRange,
            currentTime: currentTime,
            status: "Chưa vào",
          ),
        ],
      ),
    );
  }
}
