import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.isLoading.value){
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.todoData.length,
          itemBuilder: (context, index){
            final todo = controller.todoData[index];
            return ListTile(
              title: Text(todo['name']),
              subtitle: Text(todo['description']),
              trailing: Checkbox(
                  value: todo['is_done'],
                  onChanged: (value) {
                    controller.doneTask(todo['id'], !todo['is_done']);
                  }
              )
            );
          },
        );
      })
    );
  }
}
