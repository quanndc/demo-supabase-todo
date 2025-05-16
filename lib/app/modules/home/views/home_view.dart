import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(

          child: Obx(
            () => Column(
              children: [
                Text(controller.count.value.toString()),
                Text(controller.count.value.toString()),
                ElevatedButton(
                  onPressed: () {
                    controller.increment();
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
