import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final isDarkTheme = false.obs;

  final count = 0.obs;
  final name = "Quan".obs;
  @override
  void onInit() async {
    super.onInit();
    final SharedPreferences prefs = await _prefs;
    isDarkTheme.value = prefs.getBool('isDarkTheme') ?? false;
  }

  Future<void> toggleTheme(bool value) async {
    final SharedPreferences prefs = await _prefs;
    isDarkTheme.value = value;
    await prefs.setBool('isDarkTheme', value);

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
}
