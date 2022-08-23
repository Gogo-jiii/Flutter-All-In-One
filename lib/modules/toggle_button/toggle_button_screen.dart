import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class ToggleButtonScreen extends StatefulWidget {
  const ToggleButtonScreen({Key? key}) : super(key: key);

  @override
  State<ToggleButtonScreen> createState() => _ToggleButtonScreenState();
}

class _ToggleButtonScreenState extends State<ToggleButtonScreen> {
  final _isSelected1 = [false, false, false];
  final _isSelected2 = [false, false, false];
  final _isSelected3 = [true, false, false];
  final _isSelected4 = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Toggle Button"),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 10,
        trackVisibility: true,
        interactive: true,
        radius: const Radius.circular(10),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const GetTitle("Horizontal Toggle Button"),
                  const GetSizedBox(),
                  ToggleButtons(
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(8),
                    borderColor: Colors.orange,
                    selectedBorderColor: Colors.red,
                    fillColor: Colors.greenAccent,
                    color: Colors.orange,
                    splashColor: Colors.greenAccent,
                    selectedColor: Colors.green,
                    onPressed: (int index) {
                      setState(() {
                        _isSelected1[index] = !_isSelected1[index];
                        showResult(_isSelected1, index);
                        debugPrint("TAG: $_isSelected1.toString()");
                      });
                    },
                    isSelected: _isSelected1,
                    children: const [
                      Icon(Icons.account_circle),
                      Icon(Icons.add_a_photo),
                      Icon(Icons.accessibility),
                    ],
                  ),
                  const GetSizedBox(),
                  const GetTitle("Vertical Toggle Button"),
                  const GetSizedBox(),
                  ToggleButtons(
                    direction: Axis.vertical,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(8),
                    borderColor: Colors.orange,
                    selectedBorderColor: Colors.red,
                    fillColor: Colors.greenAccent,
                    color: Colors.orange,
                    splashColor: Colors.greenAccent,
                    selectedColor: Colors.green,
                    onPressed: (int index) {
                      setState(() {
                        _isSelected2[index] = !_isSelected2[index];
                        showResult(_isSelected2, index);
                      });
                    },
                    isSelected: _isSelected2,
                    children: const [
                      Icon(Icons.account_circle),
                      Icon(Icons.add_a_photo),
                      Icon(Icons.accessibility),
                    ],
                  ),
                  const GetSizedBox(),
                  const GetTitle(
                      "Only one item can be selected at a time, and at least one item should be selected at any point."),
                  const GetSizedBox(),
                  ToggleButtons(
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(8),
                    borderColor: Colors.orange,
                    selectedBorderColor: Colors.red,
                    fillColor: Colors.greenAccent,
                    color: Colors.orange,
                    splashColor: Colors.greenAccent,
                    selectedColor: Colors.green,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _isSelected3.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _isSelected3[buttonIndex] = true;
                            showResult(_isSelected3, index);
                          } else {
                            _isSelected3[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: _isSelected3,
                    children: const [
                      Icon(Icons.account_circle),
                      Icon(Icons.add_a_photo),
                      Icon(Icons.accessibility),
                    ],
                  ),
                  const GetSizedBox(),
                  const GetTitle(
                      "Only one item can be selected at a time, it is allowed to not select any item."),
                  const GetSizedBox(),
                  ToggleButtons(
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(8),
                    borderColor: Colors.orange,
                    selectedBorderColor: Colors.red,
                    fillColor: Colors.greenAccent,
                    color: Colors.orange,
                    splashColor: Colors.greenAccent,
                    selectedColor: Colors.green,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _isSelected4.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _isSelected4[buttonIndex] =
                                !_isSelected4[buttonIndex];
                            showResult(_isSelected4, index);
                          } else {
                            _isSelected4[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: _isSelected4,
                    children: const [
                      Icon(Icons.account_circle),
                      Icon(Icons.add_a_photo),
                      Icon(Icons.accessibility),
                    ],
                  ),
                  const GetSizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showResult(List<bool> isSelected, int index) {
    if (isSelected[index] == true) {
      showToast("Item number $index checked.");
    } else {
      showToast("Item number $index un-checked.");
    }
  }
}

class GetSizedBox extends StatelessWidget {
  const GetSizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 32,
    );
  }
}

class GetTitle extends StatelessWidget {
  final String title;

  const GetTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }
}
