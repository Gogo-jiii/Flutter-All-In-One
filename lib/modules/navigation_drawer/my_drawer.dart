import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/navigation_drawer/second_screen.dart';
import 'package:flutter_all_in_one/modules/navigation_drawer/third_screen.dart';
import '../common_widgets/common_widgets.dart';
import 'first_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: const [
                Icon(
                  size: 96,
                  Icons.account_box,
                  color: Colors.white,
                ),
                Text(
                  "IT Wala",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            selectedTileColor: Colors.blue,
            leading: const Icon(Icons.add),
            title: const Text("Item 1"),
            onTap: () {
              showToast("Clicked Item 1");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const FirstScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Item 2"),
            onTap: () {
              showToast("Clicked Item 2");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const SecondScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text("Item 3"),
            onTap: () {
              showToast("Clicked Item 3");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const ThirdScreen()));
            },
          ),
          const Divider(
            height: 8,
            thickness: 1,
          ),
          ListTile(
            selectedTileColor: Colors.blue,
            title: const Text("Item 4"),
            onTap: () {
              showToast("Clicked Item 4");
            },
          ),
          ListTile(
            title: const Text("Item 5"),
            onTap: () {
              showToast("Clicked Item 5");
            },
          ),
        ],
      ),
    );
  }
}
