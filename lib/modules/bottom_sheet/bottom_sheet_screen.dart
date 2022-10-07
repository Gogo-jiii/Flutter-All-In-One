import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> list = [
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
      key: _scaffoldKey,
      appBar: getAppBar(context, "Bottom Sheet"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                doModelBottomSheet();
              },
              child: const Text("Modal Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                doPersistentBottomSheet();
              },
              child: const Text("Persistent Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                doFullPagePersistentBottomSheet();
              },
              child: const Text("Full Page Persistent Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                doSpecificHeightPersistentBottomSheet();
              },
              child: const Text("Specific Height Persistent Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                doScrollableDraggableSheet();
              },
              child: const Text("Scrollable Modal Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                doListviewSheet();
              },
              child: const Text("Listview Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                doScrollableDraggableListviewSheet();
              },
              child: const Text("Scrollable Draggable Listview Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }

  void doModelBottomSheet() {
    showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.add),
                title: const Text("Add"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.account_box),
                title: const Text("Account"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.share),
                title: const Text("Share"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.delete),
                title: const Text("Delete"),
              ),
            ],
          );
        });
  }

  void doPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet(
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ), (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.add),
            title: const Text("Add"),
          ),
        ],
      );
    });
  }

  void doFullPagePersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet(
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ), (context) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.add),
              title: const Text("Add"),
            ),
          ],
        ),
      );
    });
  }

  void doSpecificHeightPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet(
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ), (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.add),
              title: const Text("Add"),
            ),
          ],
        ),
      );
    });
  }

  void doScrollableDraggableSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            snap: true,
            snapSizes: const [0.1, 0.3, 0.5],
            initialChildSize: 0.5,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return ListView(
                controller: scrollController,
                children: const [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text(
                      "A",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text(
                      "B",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text(
                      "C",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text(
                      "D",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text(
                      "E",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text(
                      "F",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text(
                      "G",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text(
                      "H",
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  void doScrollableDraggableListviewSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            snap: true,
            snapSizes: const [0.1, 0.3, 0.5],
            initialChildSize: 0.5,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                margin: const EdgeInsets.all(16),
                child: Center(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: list.length,
                      itemBuilder: (contex, index) {
                        return getListItem(context, list, index);
                      }),
                ),
              );
            },
          );
        });
  }

  void doListviewSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            snap: true,
            snapSizes: const [0.1, 0.3, 0.5],
            initialChildSize: 0.5,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                margin: const EdgeInsets.all(16),
                child: Center(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (contex, index) {
                        return getListItem(context, list, index);
                      }),
                ),
              );
            },
          );
        });
  }
}
