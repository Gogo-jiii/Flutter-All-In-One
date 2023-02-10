import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseScreen extends StatefulWidget {
  const HiveDatabaseScreen({Key? key}) : super(key: key);

  @override
  State<HiveDatabaseScreen> createState() => _HiveDatabaseScreenState();
}

class _HiveDatabaseScreenState extends State<HiveDatabaseScreen> {
  late final Box box;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingControllerOldData =
      TextEditingController();
  final TextEditingController _textEditingControllerNewData =
      TextEditingController();
  final TextEditingController _textEditingControllerDeleteData =
  TextEditingController();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await Hive.initFlutter();
    // Open the peopleBox
    await Hive.openBox('box1');
    box = Hive.box("box1");
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Hive Database"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  label: Text("Enter data to be saved"),
                  labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_textEditingController.text.isEmpty) {
                    showToast("Please enter some text");
                    return;
                  }
                  saveData(_textEditingController.text.toString());
                },
                child: const Text("Save Data"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: const Text("Get Data"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _textEditingControllerOldData,
                decoration: const InputDecoration(
                  label: Text("Enter data to be updated"),
                  labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _textEditingControllerNewData,
                decoration: const InputDecoration(
                  label: Text("Enter new data"),
                  labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  updateData();
                },
                child: const Text("Update Data"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _textEditingControllerDeleteData,
                decoration: const InputDecoration(
                  label: Text("Enter data to be deleted"),
                  labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  deleteData(_textEditingControllerDeleteData.text);
                },
                child: const Text("Delete Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveData(String data) async {
    //await box.put("name", _textEditingController.text);
    await box.add(_textEditingController.text);
    showToast("data saved");
  }

  void getData() async {
    //var name = await box.get("name");
    debugPrint("Data: ${box.values}");

    for (int i = 0; i < box.length; i++) {
      var name = await box.getAt(i);
      showToast("Name: $name");
    }
  }

  void updateData() async {
    if (_textEditingControllerOldData.text.isEmpty ||
        _textEditingControllerNewData.text.isEmpty) {
      showToast("Please enter data to be updated");
      return;
    }
    var oldData = _textEditingControllerOldData.text;
    var newData = _textEditingControllerNewData.text;

    for (int i = 0; i < box.length; i++) {
      var name = await box.getAt(i);
      if (name == oldData) {
        await box.putAt(i, newData);
        showToast("Data updated.");
        break;
      }
      if (name != oldData && i == box.length-1) {
        showToast("Data not found");
      }
    }
  }

  void deleteData(String data) async{
    if (data.isEmpty) {
      showToast("Please enter data to be deleted");
      return;
    }

    for (int i = 0; i < box.length; i++) {
      var name = await box.getAt(i);
      if (name == data) {
        await box.deleteAt(i);
        showToast("Data deleted.");
        break;
      }
      if (name != data && i == box.length-1) {
        showToast("Data not found");
      }
    }
  }
}
