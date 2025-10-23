import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:app_timekeeping/ui/core/widgets/heading_widget.dart';
import 'package:app_timekeeping/ui/features/home/widgets/form_timekeeping_widget.dart';
import 'package:app_timekeeping/ui/features/home/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> taskList = [
      {
        'title': 'Chấm công',
        'icon': Icons.fingerprint,
        'subtext': "Định vị, ảnh",
      },
      {
        'title': 'Nhập sản lượng',
        'icon': Icons.list_alt,
        'subtext': "Theo ca/ ngày",
      },
      {
        'title': 'Xin nghỉ phép',
        'icon': Icons.flight_takeoff,
        'subtext': "Xin phê duyệt",
      },
      {
        'title': 'Định vị',
        'icon': Icons.location_on,
        'subtext': 'Khu vục cho phép',
      },
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroud,
      appBar: AppBar(
        backgroundColor: AppColor.hexFFFFFF,
        title: Text(
          "Trang chủ",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTimekeepingWidget(),
            SizedBox(height: 20),
            HeadingWidget(header: "Tính năng nhanh",size: 15),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: taskList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cột
                  crossAxisSpacing: 20, // khoảng cách ngang
                  mainAxisSpacing: 20, // khoảng cách dọc
                  childAspectRatio: 1, // tỉ lệ vuông
                ),
                itemBuilder: (context, index) {
                  final item = taskList[index];
                  return TaskItem(
                    header: item['title'],
                    icon: item['icon'],
                    subtitle: item['subtext'],
                    onTap: (header) {
                      if (header == 'Chấm công') {
                        context.push('/timekeeping');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
