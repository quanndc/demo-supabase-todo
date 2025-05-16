import 'package:demo_getx_supabase/app/modules/history/views/history_view.dart';
import 'package:demo_getx_supabase/app/modules/home/views/home_view.dart';
import 'package:demo_getx_supabase/app/modules/profile/views/profile_view.dart';
import 'package:demo_getx_supabase/app/modules/todo/views/todo_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller.tabController,
        children: [TodoView(), HistoryView(), ProfileView()],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: controller.currentIndex.value,
          onTap: controller.onTabTapped,
        ),
      ),
    );
  }
}
