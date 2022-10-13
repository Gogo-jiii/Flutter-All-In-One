import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class ClipBoardScreen extends StatefulWidget {
  ClipBoardScreen({Key? key}) : super(key: key);

  @override
  State<ClipBoardScreen> createState() => _ClipBoardScreenState();

  final _formKey = GlobalKey<FormState>();
  var _enteredText = "";
}

class _ClipBoardScreenState extends State<ClipBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Clip Board"),
      body: Form(
        key: widget._formKey,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  widget._enteredText = value;
                },
                decoration: const InputDecoration(labelText: "Enter text"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget._formKey.currentState!.validate()) {
                          FlutterClipboard.copy(widget._enteredText.trim())
                              .then((value) => print('copied'));
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        FlutterClipboard.paste().then((value) {
                          setState(() {
                            showToast(value);
                          });
                        });
                      },
                      child: const Text("Get Data"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
