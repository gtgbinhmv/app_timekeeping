import 'package:flutter/material.dart';
import 'package:app_timekeeping/ui/features/timekeeping/widgets/custom_button.dart';

class ShiftCard extends StatelessWidget {
  final double scale;
  final String title;
  final String timeRange;
  final String currentTime;
  final String status;

  const ShiftCard({
    super.key,
    required this.scale,
    required this.title,
    required this.timeRange,
    required this.currentTime,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10 * scale),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14 * scale),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề ca
          Text(
            title,
            style: TextStyle(
              fontSize: 12 * scale, // tăng 5
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8 * scale),

          // Giờ hiện tại + khung giờ
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * scale,
                  vertical: 5 * scale,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F3FB),
                  borderRadius: BorderRadius.circular(20 * scale),
                ),
                child: Text(
                  currentTime,
                  style: TextStyle(
                    color: const Color(0xFF0A66C2),
                    fontWeight: FontWeight.w600,
                    fontSize: 15 * scale,
                  ),
                ),
              ),
              SizedBox(width: 8 * scale),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * scale,
                  vertical: 5 * scale,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20 * scale),
                ),
                child: Text(
                  "Ca: $timeRange",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14 * scale, 
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5 * scale),
          // Nút In / Out
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trạng thái: $status",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15 * scale,
                ),
              ),
              Row(
                children: [
                  CustomButton(
                    bgColor: const Color(0xFF0A66C2),
                    text: "In",
                    icon: Icons.login_rounded,
                    scale: scale,
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 10 * scale),
                  CustomButton(
                    bgColor: Colors.grey.shade200,
                    text: "Out",
                    icon: Icons.logout_rounded,
                    scale: scale,
                    textColor: Colors.black45,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
