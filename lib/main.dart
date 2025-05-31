import 'package:demo_getx_supabase/app/models/theme_model.dart';
import 'package:demo_getx_supabase/app/resources/theme.dart';
import 'package:demo_getx_supabase/app/utilities/theme_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: 'https://yhqnexgxdqhuclcutpxc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlocW5leGd4ZHFodWNsY3V0cHhjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc3NDU2MDAsImV4cCI6MjA2MzMyMTYwMH0.XM4qpPVIvs3FLAw_J19DTWhB2hNlqj1pM8X9W9VOM1Y',
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkTheme = prefs.getBool('isDarkTheme') ?? true;

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge).then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeModel>(
            create: (context) => ThemeModel(isDarkTheme),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );

  // multi provider
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, themeModel, child) {
      final isDarkTheme = themeModel.isDarkTheme;
      TextTheme textTheme = createTextTheme(context, 'Lexend', "Lexend");
      MaterialTheme theme = MaterialTheme(textTheme);
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: isDarkTheme == false ? theme.light() : theme.dark(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}
