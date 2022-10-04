import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/bottom_navigation/first_screen.dart';
import 'package:flutter_all_in_one/modules/bottom_navigation/second_screen.dart';
import 'package:flutter_all_in_one/modules/bottom_navigation/third_screen.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _listOfWidgets = <Widget>[
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Bottom Navigation"),
      body: Center(
        child: _listOfWidgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: "Business"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
