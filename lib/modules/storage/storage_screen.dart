import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Internal Storage",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    try {
                      getInternalStorageFile();
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
                    writeToInternalStorageFile();
                  },
                  child: const Text("Write to file.")),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    readFromInternalStorageFile();
                  },
                  child: const Text("Read file.")),
              const Divider(
                height: 16,
              ),
              const Text(
                "External Storage",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    try {
                      getExternalStorageFile();
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
                    writeToExternalStorageFile();
                  },
                  child: const Text("Write to file.")),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    readFromExternalStorageFile();
                  },
                  child: const Text("Read file.")),
              const Divider(
                height: 16,
              ),
              const Text(
                "Download Folder",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    try {
                      checkPermissions().then((value) => {
                            if (value)
                              {
                                getFileFromDownloadFolder(),
                                showToast("File created.")
                              }
                            else
                              {
                                askPermissions().then((value) => {
                                      if (value)
                                        {
                                          getFileFromDownloadFolder(),
                                          showToast("File created.")
                                        }
                                    })
                              }
                          });
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
                    writeToDownloadFolder();
                  },
                  child: const Text("Write to file.")),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    readFromDownloadFolder();
                  },
                  child: const Text("Read file.")),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> get createInternalStorageFile async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getInternalStorageFile() async {
    final path = await createInternalStorageFile;
    return File("$path/internal_storage_file.txt");
  }

  void writeToInternalStorageFile() async {
    final file = await getInternalStorageFile();
    file.writeAsString("some internal storage text");
    showToast("File written.");
  }

  void readFromInternalStorageFile() async {
    final file = await getInternalStorageFile();
    file.readAsString().then((value) => {showToast("Data: $value")});
  }

  Future<String?> get createExternalStorageFile async {
    final directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  Future<File> getExternalStorageFile() async {
    final path = await createExternalStorageFile;
    return File("$path/external_storage_file.txt");
  }

  void writeToExternalStorageFile() async {
    final file = await getExternalStorageFile();
    file.writeAsString("some external storage text");
    showToast("File written.");
  }

  void readFromExternalStorageFile() async {
    final file = await getExternalStorageFile();
    file.readAsString().then((value) => {showToast("Data: $value")});
  }

  get createFileInDownloadFolder async {
    final directory =
        await getExternalStorageDirectories(type: StorageDirectory.downloads);
    debugPrint(directory?.first.path);
    return directory?.first.path;
  }

  Future<File> getFileFromDownloadFolder() async {
    final path = await createFileInDownloadFolder;
    return File("$path/download_folder_file.txt");
  }

  void writeToDownloadFolder() async {
    final file = await getFileFromDownloadFolder();
    file.writeAsString("some download folder text");
    showToast("File written.");
  }

  void readFromDownloadFolder() async {
    final file = await getFileFromDownloadFolder();
    file.readAsString().then((value) => {showToast("Data: $value")});
  }

  Future<bool> checkPermissions() async {
    var permission = await Permission.storage.status;
    if (permission.isGranted) {
      showToast("Permissions Already Granted.");
      return true;
    } else {
      showToast("Permissions Denied.");
      return false;
    }
  }

  Future<bool> askPermissions() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      showToast("Permissions Granted.");
      return true;
    } else {
      showToast("Permissions Denied.");
      return false;
    }
  }
}
