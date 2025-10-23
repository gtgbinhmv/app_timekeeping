// 📄 textfield_widget.dart
import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const TextfieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.hex7A8A98),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Thêm ghi chú (tùy chọn)…',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
