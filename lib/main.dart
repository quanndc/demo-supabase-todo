import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://lvijydbfimnfztbcbhds.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx2aWp5ZGJmaW1uZnp0YmNiaGRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczOTQwMjMsImV4cCI6MjA2Mjk3MDAyM30.HjxK9lQ72IOtfdTBKj-jXMcylvjqqYFjHPpDg2P9LTs',
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
