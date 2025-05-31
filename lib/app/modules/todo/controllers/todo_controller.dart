import 'package:demo_getx_supabase/app/models/todo_model.dart';
import 'package:demo_getx_supabase/app/services/todo_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodoController extends GetxController with StateMixin<List<TodoModel?>> {
  //TODO: Implement TodoController

  final count = 0.obs;

  final isLoading = false.obs;
  late final todoData = RxList<TodoModel>([]);

  @override
  void onInit() async {
    super.onInit();
    await getTodo();
  }

  Future<void> getTodo() async {
    change(null, status: RxStatus.loading());
    try{
      todoData.value = await TodoService().getTodo();
      change(todoData.value, status: RxStatus.success());
    }
    catch(e){
      change(null, status: RxStatus.error(e.toString()));
    }
  }


  Future<void> doneTask(int id, bool value) async {
    try{
      await TodoService().doneTask(id, value);
      todoData.value = await TodoService().getTodo();
      change(todoData.value, status: RxStatus.success());


      Get.snackbar('Success', "Update todo success",
      backgroundColor: Colors.green,
      icon: Icon(Icons.done),
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
      borderRadius: 10,
      padding: const EdgeInsets.all(10),
      );

      // filter to remove old task by id
    }
    catch(e){
      Get.showSnackbar(
        GetSnackBar(
          borderRadius: 10,
          padding: EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          title: 'Error',
          message: 'Update todo failed',
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  Future<void> deleteTask(int id) async {
    try{
      await TodoService().deleteTask(id);
      todoData.value = await TodoService().getTodo();
      change(todoData.value, status: RxStatus.success());


      Get.snackbar('Success', "Deleted todo success",
        backgroundColor: Colors.green,
        icon: Icon(Icons.done),
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
        borderRadius: 10,
        padding: const EdgeInsets.all(10),
      );

      // filter to remove old task by id
    }
    catch(e){
      Get.showSnackbar(
        GetSnackBar(
          borderRadius: 10,
          padding: EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          title: 'Error',
          message: 'Update todo failed',
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  // flutter pub get

  @override
  void onReady() async {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
