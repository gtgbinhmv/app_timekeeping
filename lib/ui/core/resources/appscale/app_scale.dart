import 'package:flutter/material.dart';

class AppScale {
  static double of(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Tính toán tỉ lệ so với màn hình "chuẩn" 400px
    return (screenWidth / 400).clamp(0.7, 1.4);
  }
}
