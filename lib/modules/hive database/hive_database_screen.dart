import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabaseScreen extends StatefulWidget {
  const HiveDatabaseScreen({Key? key}) : super(key: key);

  @override
  State<HiveDatabaseScreen> createState() => _HiveDatabaseScreenState();
}

class _HiveDatabaseScreenState extends State<HiveDatabaseScreen> {
  List<int> key = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    1,
    2,
    3,
    4,
    5
  ];
  late BoxCollection collection;
  late Future<CollectionBox<Map>> box1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Hive Database"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                setupDatabase();
              },
              child: const Text("Setup Database"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
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
          ],
        ),
      ),
    );
  }

  void setupDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    collection = await BoxCollection.open(
      'MyFirstFluffyBox',
      {"box1"},
      key: HiveAesCipher(key),
    );

    box1 = collection.openBox<Map>("box1");
  }

  void saveData() async {
    box1.then((value) => {
          value.put("key1", {"name": "Vaibhav"}),
          value.put("key2", {"name": "Ghanekar"})
        });
  }

  void getData() async {
    Future<Map?> data1;
    Future<Map?> data2;
    await box1.then((value) => {
          data1 = value.get("key1").then((value) {
            showToast("Data1: ${value.toString()}");
          }),
          data2 = value.get("key2").then((value) {
            showToast("Data2: ${value.toString()}");
          }),
        });
  }
}
