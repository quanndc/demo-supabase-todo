import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../models/theme_model.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: FilledButton.icon(
          onPressed: () async {
            // await controller.logout();
          },
          icon: const Icon(Icons.logout),
          label: const Text("Logout"),
        ),
      ),
      floatingActionButton: Obx(() =>
          Switch(
              value: controller.isDarkTheme.value,
              onChanged: (value) async {
                  await controller.toggleTheme(value);
                  Provider.of<ThemeModel>(context, listen: false).toggleTheme(controller.isDarkTheme.value);
              })
      ));
  }
}
