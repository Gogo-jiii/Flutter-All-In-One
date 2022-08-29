import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class AlertDialogScreen extends StatefulWidget {
  const AlertDialogScreen({Key? key}) : super(key: key);

  @override
  State<AlertDialogScreen> createState() => _AlertDialogScreenState();
}

class _AlertDialogScreenState extends State<AlertDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Alert dialog"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showSimpleAlertdialog();
                },
                child: const Text(
                  "Simple Alert Dialog",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  showOptionAlertDialog();
                },
                child: const Text(
                  "Option Alert Dialog",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  showSingleChoiceAlertDialog();
                },
                child: const Text(
                  "Single Choice Alert Dialog",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  showMultipleChoiceAlertDialog();
                },
                child: const Text(
                  "Multiple Choice Alert Dialog",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSimpleAlertdialog() {
    showDialog(
      barrierDismissible: false,
      //barrierColor: Colors.white,
      barrierLabel: "Hello",
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        elevation: 8,
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        title: const Text("Title"),
        content: const Text("Content"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Cancel");
              Navigator.pop(context, "Cancel");
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Ok");
              Navigator.pop(context, "Ok");
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  Future<void> showOptionAlertDialog() async {
    switch (await showDialog<Data>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Data.firstOption);
                },
                child: const Text('First Option'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Data.secondOption);
                },
                child: const Text('Second Option'),
              ),
            ],
          );
        })) {
      case Data.firstOption:
        showToast("First Option");
        break;
      case Data.secondOption:
        showToast("Second Option");
        break;
      case null:
        // dialog dismissed
        break;
    }
  }

  void showSingleChoiceAlertDialog() {
    RadioButtonData selectedValue = RadioButtonData.A;

    showDialog(
      barrierDismissible: false,
      //barrierColor: Colors.white,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        elevation: 8,
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        title: const Text("Select Option"),
        content: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      groupValue: selectedValue,
                      onChanged: (RadioButtonData? value) {
                        setState(() {
                          selectedValue = value!;
                          showToast("A is selected.");
                        });
                      },
                      value: RadioButtonData.A,
                    ),
                    const Text("A"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      groupValue: selectedValue,
                      onChanged: (RadioButtonData? value) {
                        setState(() {
                          selectedValue = value!;
                          showToast("B is selected.");
                        });
                      },
                      value: RadioButtonData.B,
                    ),
                    const Text("B"),
                  ],
                )
              ],
            );
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Cancel");
              Navigator.pop(context, "Cancel");
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Selected Value: $selectedValue");
              Navigator.pop(context, "Ok");
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  void showMultipleChoiceAlertDialog() {
    bool checkboxValueA = false;
    bool checkboxValueB = false;
    bool checkboxValueC = false;
    List<bool> selectedCheckboxes = [false, false, false];

    showDialog(
      barrierDismissible: false,
      //barrierColor: Colors.white,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        elevation: 8,
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        title: const Text("Select Option"),
        content: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: checkboxValueA,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxValueA = value!;

                          var isChecked = "";
                          if (checkboxValueA == true) {
                            isChecked = "checked";
                          } else {
                            isChecked = "un-checked";
                          }

                          selectedCheckboxes[0] = checkboxValueA;
                          showToast("A is $isChecked");
                        });
                      },
                    ),
                    const Text("A"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: checkboxValueB,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxValueB = value!;

                          var isChecked = "";
                          if (checkboxValueB == true) {
                            isChecked = "checked";
                          } else {
                            isChecked = "un-checked";
                          }
                          selectedCheckboxes[1] = checkboxValueB;
                          showToast("B is $isChecked");
                        });
                      },
                    ),
                    const Text("B"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: checkboxValueC,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxValueC = value!;

                          var isChecked = "";
                          if (checkboxValueC == true) {
                            isChecked = "checked";
                          } else {
                            isChecked = "un-checked";
                          }

                          selectedCheckboxes[2] = checkboxValueC;
                          showToast("C is $isChecked");
                        });
                      },
                    ),
                    const Text("C"),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Cancel");
              Navigator.pop(context, "Cancel");
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Result : $selectedCheckboxes");
              Navigator.pop(context, "Ok");
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
}

enum Data {
  firstOption,
  secondOption,
}

enum RadioButtonData { A, B, C }
