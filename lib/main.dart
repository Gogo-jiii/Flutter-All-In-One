import 'package:flutter/material.dart';

import 'modules/snackbar/snackbar_screen.dart';

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
      routes: {
        ListItemsType.snackBar.toString(): (context) => const SnackBarScreen(),
      },
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
  var data = ["Snack Bar"];

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
            return getListUI(context, index);
          }),
    );
  }

  Widget getListUI(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        navigate(index);
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 1,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              width: 1.0,
              style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        borderOnForeground: true,
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Center(
            child: Text(
              data[index],
              softWrap: true,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigate(int index) {
    var type = getListItemType(index);
    switch (type) {
      case ListItemsType.snackBar:
        {
          Navigator.pushNamed(context, ListItemsType.snackBar.toString());
        }
    }
  }
}

enum ListItemsType {
  snackBar;
}

ListItemsType getListItemType(int index) {
  return ListItemsType.values[index];
}
