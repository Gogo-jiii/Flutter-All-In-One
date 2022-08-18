import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class GetTextFromTextFieldScreen extends StatefulWidget {
  const GetTextFromTextFieldScreen({Key? key}) : super(key: key);

  @override
  State<GetTextFromTextFieldScreen> createState() =>
      _GetTextFromTextFieldScreenState();
}

class _GetTextFromTextFieldScreenState
    extends State<GetTextFromTextFieldScreen> {
  bool _validate = true;
  var _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Get Text From TextField"),
      body: Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Column(
          children: [
            TextFormField(
              controller: _text,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Enter name",
                  errorText: _validate ? null : "Field can not be empty"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_text.text.isEmpty) {
                    _validate = false;
                  } else {
                    _validate = true;
                    showToast(_text.text);
                  }
                });
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
