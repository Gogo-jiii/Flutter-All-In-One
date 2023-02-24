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
  final _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Get Text From TextField"),
      body: Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Column(
          children: [
            getTextField(label: "Enter Name", controller: _text, validate: _validate),
            getSizedBox(16.0),
            getElevatedButton("Submit", onPressed: (){
              setState(() {
                if (_text.text.isEmpty) {
                  _validate = false;
                } else {
                  _validate = true;
                  showToast(_text.text);
                }
              });
            }),
          ],
        ),
      ),
    );
  }
}
