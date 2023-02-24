import 'package:flutter/material.dart';
import '../common_widgets/common_widgets.dart';

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

void showMultipleChoiceAlertDialog(BuildContext context) {
  showToast("yay");
  bool checkboxValueA = false;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  List<bool> selectedCheckboxes = [false, false, false];

  showDialog(
    barrierDismissible: false,
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
    ),
  );
}
