import 'package:app_timekeeping/ui/core/resources/appscale/app_scale.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String header;
  final String subtitle;
  final IconData icon;
  final void Function(String header)? onTap;

  const TaskItem({
    super.key,
    required this.header,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // scale dựa theo độ rộng màn hình
    final scale = AppScale.of(context);

    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(header);
      },
      child: Container(
        padding: EdgeInsets.all(16 * scale),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16 * scale),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8 * scale,
              offset: Offset(0, 3 * scale),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon trong vòng tròn
            Container(
              padding: EdgeInsets.all(10 * scale),
              decoration: const BoxDecoration(
                color: Color(0xFFE9F3FB),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24 * scale,
                color: const Color(0xFF0A66C2),
              ),
            ),
            SizedBox(height: 8 * scale),
            // Tiêu đề
            Text(
              header,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16 * scale,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4 * scale),
            // Phụ đề
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13 * scale, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
