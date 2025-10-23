// bottom_custom.dart
import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:app_timekeeping/ui/features/bottom/bottom_model.dart';
import 'package:app_timekeeping/ui/features/home/home_screen.dart';
import 'package:app_timekeeping/ui/features/timekeeping/timekeeping_screen.dart';
import 'package:app_timekeeping/ui/features/work/word_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomCustom extends ConsumerWidget {
  const BottomCustom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavIndex = ref.watch(bottomNavIndexProvider);

    final List<Map<String, dynamic>> naviItem = [
      {'icon': Icons.home, 'label': 'Trang chủ'},
      {'icon': Icons.history, 'label': ""},
      {'icon': Icons.work, 'label': 'Công việc'},
      // {'icon': Icons.pie_chart, 'label': 'Report'},
      // {'icon': Icons.person, 'label': 'Profile'},
    ];

    final items =
        naviItem
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item['icon'], size: 24),
                label: item['label'],
              ),
            )
            .toList();
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: [HomeScreen(), TimekeepingScreen(), WordScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        items: items,
        selectedItemColor: AppColor.hexff0363af,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
