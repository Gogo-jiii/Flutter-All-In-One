import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/theme/styles.dart';
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
        margin: setMargin(16.0),
        child: Center(
          child: Column(
            children: [
              getElevatedButton("Simple Alert Dialog", onPressed: () {
                showSimpleAlertdialog();
              }),
              getSizedBox(32.0),
              getElevatedButton("Option Alert Dialog", onPressed: () {
                showOptionAlertDialog();
              }),
              getSizedBox(32.0),
              getElevatedButton("Single Choice Alert Dialog", onPressed: () {
                showSingleChoiceAlertDialog();
              }),
              getSizedBox(32.0),
              getElevatedButton("Multiple Choice Alert Dialog", onPressed: () {
                showMultipleChoiceAlertDialog();
              }),
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
      builder: (BuildContext context) => getSimpleAlertDialog(
        "Title",
        "Content",
        onOkPressed: () {
          showToast("OK");
          Navigator.pop(context, "OK");
        },
        onCancelPressed: () {
          showToast("Cancel");
          Navigator.pop(context, "Cancel");
        },
      ),
    );
  }

  Future<void> showOptionAlertDialog() async {
    switch (await showDialog<Data>(
        context: context,
        builder: (BuildContext context) {
          return getOptionAlertDialog(onFirstOptionPressed: () {
            Navigator.pop(context, Data.firstOption);
          }, onSecondOptionPressed: () {
            Navigator.pop(context, Data.secondOption);
          });
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
        backgroundColor: Styles().getAlertDialogBackgroundColor(),
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
                    Text(
                      "A",
                      style: TextStyle(
                        color: Styles().getAlertDialogTextColor(),
                      ),
                    ),
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
                    Text(
                      "B",
                      style: TextStyle(
                        color: Styles().getAlertDialogTextColor(),
                      ),
                    ),
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
        backgroundColor: Styles().getAlertDialogBackgroundColor(),
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
                    Text(
                      "A",
                      style: TextStyle(
                        color: Styles().getAlertDialogTextColor(),
                      ),
                    ),
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
                    Text(
                      "B",
                      style: TextStyle(
                        color: Styles().getAlertDialogTextColor(),
                      ),
                    ),
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
