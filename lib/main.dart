import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/snackbar/snackbar_screen.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import 'modules/common_widgets/common_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter All in One'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = ["Snack Bar", "Toast"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: getListItem(context, data, index),
                onTap: () {
                  navigate(context, index);
                });
          }),
    );
  }
}

void navigate(BuildContext context, int index) {
  var type = getListItemType(index);
  switch (type) {
    case ListItemsType.snackBar:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SnackBarScreen()));
      break;
    case ListItemsType.toast:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ToastScreen()));
      break;
  }
}

enum ListItemsType {
  snackBar,
  toast;
}

ListItemsType getListItemType(int index) {
  return ListItemsType.values[index];
}
