import 'package:get/get.dart';

class HistoryController extends GetxController {
    List<String> history = <String>[].obs;

    @override
    void onInit() {
        super.onInit();
        // Load history from local storage or database
        loadHistory();
    }

    void loadHistory() {
        // Simulate loading history from local storage or database
        history = ['Item 1', 'Item 2', 'Item 3'].obs;
    }
}
