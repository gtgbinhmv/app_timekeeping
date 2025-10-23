import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  final String currentime;
  final double scale;
  final String timeOut;
  final String timeIn;
  const Card2({
    super.key,
    required this.currentime,
    required this.scale,
    required this.timeOut,
    required this.timeIn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14 * scale),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.hex7A8A98, width: scale * 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(17 * scale),
        boxShadow: [
          BoxShadow(
            color: AppColor.Hex0D000000,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            currentime,
            style: TextStyle(fontSize: 25 * scale, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10 * scale),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(Icons.location_on, "Vị trí", scale),
              _buildButton(Icons.camera_alt, "Ảnh", scale),
              _buildButton(Icons.note_add, "Ghi chú", scale),
            ],
          ),
          SizedBox(height: 10 * scale),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeExpected("Giờ vào dự kiến", timeIn, scale),
              _buildTimeExpected("Giờ ra dự kiến", timeOut, scale),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildButton(IconData icon, String text, double scale) {
  return OutlinedButton.icon(
    onPressed: () {},
    icon: Icon(icon, color: const Color(0xFF0A1F44), size: 20 * scale),
    label: Text(
      text,
      style: TextStyle(
        color: const Color(0xFF0A1F44),
        fontWeight: FontWeight.w600,
        fontSize: 12 * scale,
      ),
    ),
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: AppColor.hex7A8A98, width: 1 * scale),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50 * scale),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15 * scale,
        vertical: 7 * scale,
      ),
      backgroundColor: AppColor.hexFFFFFF,
      elevation: 0,
    ),
  );
}

Widget _buildTimeExpected(String text, String time, double scale) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.hex7A8A98, width: 1 * scale),
      borderRadius: BorderRadius.circular(25 * scale),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15 * scale,
        vertical: 7 * scale,
      ),
      child: Column(children: [Text(text), Text(time)]),
    ),
  );
}
