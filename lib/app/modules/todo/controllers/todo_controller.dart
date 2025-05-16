import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodoController extends GetxController {
  //TODO: Implement TodoController

  final count = 0.obs;

  final isLoading = false.obs;
  late final todoData = [].obs;

  @override
  void onInit() async {
    super.onInit();
    await getTodo();
  }

  Future<void> getTodo() async {
    isLoading.value = true;
    try {
      todoData.value = await Supabase.instance.client.from('todos').select().order('id', ascending: true);
    }catch (e) {
      if(kDebugMode){
        print("Error fetching todos");
      }
    }finally {
      isLoading.value = false;
    }
  }


  Future<void> doneTask(int id, bool value) async {
    try{
      await Supabase.instance.client.from('todos').update({'is_done': value}).eq('id',id);
      todoData.value = await Supabase.instance.client.from('todos').select().order('id', ascending: true);
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
