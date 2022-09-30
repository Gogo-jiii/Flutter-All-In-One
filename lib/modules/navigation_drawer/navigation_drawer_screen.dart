import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerScreen> createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Navigation Drawer"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!.closeDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: Drawer(
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
              leading: const Icon(Icons.add),
              title: const Text("Item 1"),
              onTap: () {
                showToast("Clicked Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Item 2"),
              onTap: () {
                showToast("Clicked Item 2");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Item 3"),
              onTap: () {
                showToast("Clicked Item 3");
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 8,
              thickness: 1,
            ),
            ListTile(
              title: const Text("Item 4"),
              onTap: () {
                showToast("Clicked Item 4");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Item 5"),
              onTap: () {
                showToast("Clicked Item 5");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
