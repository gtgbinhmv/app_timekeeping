import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.header, required this.size});
  final String header;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: TextStyle(
        color: AppColor.hex1A1C1E,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
