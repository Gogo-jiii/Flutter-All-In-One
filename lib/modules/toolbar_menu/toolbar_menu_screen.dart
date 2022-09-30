import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class ToolbarMenuScreen extends StatefulWidget {
  const ToolbarMenuScreen({Key? key}) : super(key: key);

  @override
  State<ToolbarMenuScreen> createState() => _ToolbarMenuScreenState();
}

class _ToolbarMenuScreenState extends State<ToolbarMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              showToast("Clicked Save Button");
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              showToast("Clicked Home Button");
            },
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                onTap: () {
                  showToast("One clicked.");
                },
                child: const Text("One"),
              ),
              PopupMenuItem<int>(
                onTap: () {
                  showToast("Two clicked.");
                },
                child: const Text("Two"),
              ),
              PopupMenuItem<int>(
                onTap: () {
                  showToast("Three clicked.");
                },
                child: const Text("Three"),
              ),
            ];
          })
        ],
        title: const Text("Toolbar Menu"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text("Toolbar Menu"),
      ),
    );
  }
}
