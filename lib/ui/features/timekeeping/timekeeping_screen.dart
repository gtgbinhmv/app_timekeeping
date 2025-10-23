import 'package:app_timekeeping/data/providers/time_provider.dart';
import 'package:app_timekeeping/ui/core/widgets/heading_widget.dart';
import 'package:app_timekeeping/ui/features/timekeeping/widgets/location_card.dart';
import 'package:app_timekeeping/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:app_timekeeping/ui/core/resources/appscale/app_scale.dart';
import 'package:app_timekeeping/ui/features/timekeeping/widgets/card2.dart';
import 'package:app_timekeeping/ui/features/timekeeping/widgets/time_keeping_card.dart';

class TimekeepingScreen extends ConsumerWidget {
  const TimekeepingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scale = AppScale.of(context);
    final shiftInfo =
        WorkShiftHelper.getCurrentShiftInfo(); // Lấy dữ liệu ca làm

    final shitf = ref.watch(shiftInfoProvider).value;

    return Scaffold(
      backgroundColor: AppColor.backgroud,
      appBar: AppBar(
        title: const Text("Chấm công"),
        backgroundColor: AppColor.hexFFFFFF,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(17 * scale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TimekeepingCard(
                dateFormat: DateTime.now().toIso8601String(),
                dateNumber: shiftInfo.dateNumber,
                dateText: shiftInfo.dateText,
                scale: scale,
                shiftTitle: shiftInfo.shiftTitle,
                timeRange: shiftInfo.timeRange,
                currentTime: shitf?.currentTime ?? '',
              ),
              SizedBox(height: 16 * scale),
              Card2(
                currentime: shitf?.currentTime ?? '',
                scale: scale,
                timeIn: shiftInfo.timeIn,
                timeOut: shiftInfo.timeOut,
              ),
              SizedBox(height: 10 * scale),
              HeadingWidget(header: "Vị trí hiện tại", size: 15 * scale),
              LocationCard(),
              SizedBox(height: 80 * scale),
            ],
          ),
        ),
      ),

      // Floating button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17 * scale),
        child: SizedBox(
          width: double.infinity,
          height: 56 * scale,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.hexff0363af,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25 * scale),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login, // biểu tượng login
                  color: Colors.white,
                  size: 22 * scale,
                ),
                SizedBox(width: 8 * scale),
                Text(
                  "Vào",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16 * scale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
