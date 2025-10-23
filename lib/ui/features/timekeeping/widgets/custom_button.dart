import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.bgColor,
    required this.text,
    required this.icon,
    required this.scale,
    required this.textColor,
  });
  final Color bgColor;
  final String text;
  final IconData icon;
  final double scale;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 52 * scale,
    height: 52 * scale,
    decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: textColor, size: 18 * scale),
        SizedBox(height: 2 * scale),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textColor,
            fontSize: 12 * scale,
          ),
        ),
      ],
    ),
  );
  }
}
