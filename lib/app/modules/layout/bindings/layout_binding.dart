import 'package:demo_getx_supabase/app/modules/home/controllers/home_controller.dart';
import 'package:demo_getx_supabase/app/modules/profile/controllers/profile_controller.dart';
import 'package:demo_getx_supabase/app/modules/todo/controllers/todo_controller.dart';
import 'package:get/get.dart';

import '../../history/controllers/history_controller.dart';
import '../controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(() => LayoutController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
