import 'package:app_timekeeping/ui/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class WordScreen extends StatelessWidget {
  const WordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(name: "Admin", phone: "0123456789", role: "Nhân viên"),
        ],
      ),
    );
  }
}
