import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HistoryView'), centerTitle: true),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.history.isEmpty
                  ? Text('No history available')
                  : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.history.length,
                      itemExtent: 150,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.history[index]),
                          onTap: () {
                            // Handle item tap
                            Get.snackbar(
                              'Item Tapped',
                              'You tapped on ${controller.history[index]}',
                            );
                          },
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Handle item delete
                              controller.history.removeAt(index);
                              Get.snackbar(
                                'Item Deleted',
                                'You deleted ${controller.history[index]}',
                              );
                            },
                          ),
                          subtitle: Text(
                            'Subtitle for ${controller.history[index]}',
                          ),
                          leading: Icon(Icons.history),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          selected: controller.history[index] == 'Item 1',
                          // Example condition
                          selectedTileColor: Colors.blue[100],
                          onLongPress: () {
                            // Handle item long press
                            Get.snackbar(
                              'Item Long Pressed',
                              'You long pressed on ${controller.history[index]}',
                            );
                          },
                        );
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
