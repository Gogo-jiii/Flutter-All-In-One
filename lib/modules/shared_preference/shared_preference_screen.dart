import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceScreen extends StatefulWidget {
  const SharedPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<SharedPreferenceScreen> createState() => _SharedPreferenceScreenState();
}

class _SharedPreferenceScreenState extends State<SharedPreferenceScreen> {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Shared Preference"),
      body: Container(
        margin: setMargin(16),
        child: Column(
          children: [
            const Text(
              "Save following data to the shared preference.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            getSizedBox(16),
            const Text(
              "IT WALA, 100, 10.5, True, ['A', 'B', 'C']",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            getSizedBox(16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getElevatedButton(
                      "Save data",
                      onPressed: () {
                        saveData();
                      },
                    ),
                  ),
                ),
                getSizedBox(16),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getElevatedButton(
                      "Get data",
                      onPressed: () {
                        getData();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void saveData() async {
    prefs = await SharedPreferences.getInstance();

    await prefs.setInt('counter', 10);
    await prefs.setBool('repeat', true);
    await prefs.setDouble('decimal', 1.5);
    await prefs.setString('action', 'Start');
    await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);

    showToast("Data saved");
  }

  void getData() async {
    prefs = await SharedPreferences.getInstance();

    final int? counter = prefs.getInt('counter');
    final bool? repeat = prefs.getBool('repeat');
    final double? decimal = prefs.getDouble('decimal');
    final String? action = prefs.getString('action');
    final List<String>? items = prefs.getStringList('items');

    showToast("Result: $counter, $repeat, $decimal, $action, $items");
  }
}
