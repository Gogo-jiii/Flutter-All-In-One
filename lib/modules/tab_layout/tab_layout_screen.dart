import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/tab_layout/first_screen.dart';
import 'package:flutter_all_in_one/modules/tab_layout/second_screen.dart';
import 'package:flutter_all_in_one/modules/tab_layout/third_screen.dart';

import '../theme/styles.dart';

class TabLayoutScreen extends StatelessWidget {
  const TabLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Styles().getAppbarColor(),
            title: const Text("Tab Layout"),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]),
          ),
          body: const TabBarView(
              children: [FirstScreen(), SecondScreen(), ThirdScreen()]),
        ),
      ),
    );
  }
}
