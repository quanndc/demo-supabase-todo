import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: FilledButton.icon(
            onPressed: () async {
              await controller.loginWithGoogle();
            },
            icon: Icon(Icons.login),
            label: Text("Login with Google"))
      ),
    );
  }
}
