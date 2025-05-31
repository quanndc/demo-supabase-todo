import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primary,
      appBar: AppBar(title: const Text('TodoView'), centerTitle: true),
      body: Center(child: Text("Xin chao toi la Quan",style: TextStyle(
        color: context.theme.colorScheme.onPrimary,
          fontSize: 100
      ),))
    );
  }
}
