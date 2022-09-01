import 'package:flutter/material.dart';

import '../../common_widgets/common_widgets.dart';
import '../../toast/toast_screen.dart';

class SwipeToDeleteItemListviewScreen extends StatefulWidget {
  const SwipeToDeleteItemListviewScreen({Key? key}) : super(key: key);

  @override
  State<SwipeToDeleteItemListviewScreen> createState() =>
      _SwipeToDeleteItemListviewScreenState();
}

class _SwipeToDeleteItemListviewScreenState
    extends State<SwipeToDeleteItemListviewScreen> {
  final List<String> list = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Swipe To Delete Item Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var item = list[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: Key(item),
                background: Container(
                  color: Colors.white,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.delete),
                    ),
                  ),
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    bool delete = true;
                    final snackbarController =
                        ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 3),
                        content: Text('Deleted ${list[index]}'),
                        action: SnackBarAction(
                            label: 'Undo', onPressed: () => delete = false),
                      ),
                    );
                    await snackbarController.closed;
                    return delete;
                  } else {
                    return false;
                  }
                },
                onDismissed: (_) {
                  setState(() {
                    list.removeAt(index);
                  });
                },
                child: GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
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
                            list[index],
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      showToast("Selected : ${list[index]}");
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
