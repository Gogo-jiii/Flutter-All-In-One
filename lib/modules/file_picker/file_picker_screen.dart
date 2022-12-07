import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({Key? key}) : super(key: key);

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  var data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "File Picker"),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Data: $data"),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  pickSingleFile();
                },
                child: const Text("Pick a single file"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  pickMultipleFiles();
                },
                child: const Text("Pick multiple files"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  pickOnlyPdfFile();
                },
                child: const Text("Pick only pdf file"),
              ),
            ],
          ),
        ));
  }

  void pickSingleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String? path = result.files.single.path;
      File file = File(path!);

      setState(() {
        data = result.files.single.name;
      });
    }
  }

  void pickMultipleFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      List<File> list = result.paths.map((path) => File(path!)).toList();
      setState(() {
        data = list.toString();
      });
    }
  }

  void pickOnlyPdfFile() async {
    List<String> extensionList = ["pdf"];
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: extensionList);
    if (result != null) {
      setState(() {
        data = result.files.single.name;
      });
    }
  }
}
