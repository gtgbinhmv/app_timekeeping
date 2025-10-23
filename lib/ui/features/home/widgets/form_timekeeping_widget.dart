import 'package:app_timekeeping/data/providers/time_provider.dart';
import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:app_timekeeping/ui/core/resources/appscale/app_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FormTimekeepingWidget extends ConsumerWidget {
  const FormTimekeepingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scale = AppScale.of(context);

    final DateTime timeNow = DateTime.now();
    final shift = ref.watch(shiftInfoProvider).value;

    final weekdayNames = {
      1: 'T2',
      2: 'T3',
      3: 'T4',
      4: 'T5',
      5: 'T6',
      6: 'T7',
      7: 'CN',
    };

    final weekdayText = weekdayNames[timeNow.weekday] ?? '';
    final dateText = 'Hôm nay • $weekdayText';

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(17 * scale),
          decoration: BoxDecoration(
            color: AppColor.hexFFFFFF,
            borderRadius: BorderRadius.circular(20 * scale),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Phần trên
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cột bên trái: trạng thái + giờ
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trạng thái: Chưa chấm",
                        style: TextStyle(
                          fontSize: 12 * scale,
                          color: AppColor.hex7A8A98,
                        ),
                      ),
                      Text(
                        shift?.currentTime ?? '',
                        style: TextStyle(
                          fontSize: 22 * scale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Ô ngày
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12 * scale,
                      vertical: 6 * scale,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.hexF0F4F7,
                      borderRadius: BorderRadius.circular(20 * scale),
                    ),
                    child: Text(
                      dateText,
                      style: TextStyle(
                        color: AppColor.hex7A8A98,
                        fontWeight: FontWeight.w500,
                        fontSize: 13 * scale,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16 * scale),

              // Nút chấm công vào
              ElevatedButton.icon(
                onPressed: () {
                  context.push('/timekeeping');
                },
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: AppColor.hexFFFFFF,
                  size: 22 * scale,
                ),
                label: Text(
                  'Chấm công vào',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.hexFFFFFF,
                    fontSize: 15 * scale,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.hexff0363af,
                  minimumSize: Size(double.infinity, 48 * scale),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30 * scale),
                  ),
                ),
              ),

              SizedBox(height: 10 * scale),

              //Nút chấm công ra
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.black87,
                  size: 22 * scale,
                ),
                label: Text(
                  'Chấm công ra',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 15 * scale,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColor.hexE6EEF8, width: scale * 2),
                  minimumSize: Size(double.infinity, 48 * scale),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30 * scale),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
