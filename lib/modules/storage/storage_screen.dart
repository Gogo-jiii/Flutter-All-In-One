import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:path_provider/path_provider.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Local Storage"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  try {
                    createFile();
                    showToast("File created.");
                  } catch (e) {
                    debugPrintStack(label: e.toString());
                  }
                },
                child: const Text("Create a file.")),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  writeToFile();
                },
                child: const Text("Write to file.")),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  readFile();
                },
                child: const Text("Read file.")),
          ],
        ),
      ),
    );
  }

  Future<File> createFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File("$path/abc.txt");
  }

  void writeToFile() async {
    final file = await createFile();
    file.writeAsString("some text");
    showToast("File written.");
  }

  void readFile() async {
    final file = await createFile();
    final data = file.readAsString();
    showToast("Data: ${data.toString()}");
  }
}
