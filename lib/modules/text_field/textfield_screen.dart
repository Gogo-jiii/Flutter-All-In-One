import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import '../common_widgets/common_widgets.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  var _counterText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "Text Field"),
        body: Container(
          margin: const EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Label"),
                      labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: "Label Text",
                      labelStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Hint text",
                      hintStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Floating label"),
                      floatingLabelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      helperText: "Helper text",
                      helperStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      errorText: "Error text",
                      errorStyle: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Text("Floating label alignment"),
                        floatingLabelAlignment: FloatingLabelAlignment.center),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Text("Prefix icon"),
                        prefixIcon: Icon(Icons.account_box),
                        prefixIconColor: Colors.lightGreenAccent),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Text("Prefix something"), prefix: Text("Rs.")),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Prefix text"),
                      prefixText: "Mrs.",
                      prefixStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Suffix icon"),
                      suffixIconColor: Colors.lightGreenAccent,
                      suffixIcon: Icon(Icons.access_alarm),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Text("Suffix something"), suffix: Text(".com")),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Suffix text"),
                      suffixText: "@google.com",
                      suffixStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _counterText = (10 - value.length).toString();
                      });
                    },
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: InputDecoration(
                        label: const Text("Counter"),
                        counterStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        counterText: "Remaining: $_counterText"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Text("Filled"),
                        filled: true,
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.green),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Text("Disabled"), enabled: false),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Underline Border"),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent,
                            width: 5,
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Outline Border"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Input type name"),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Input type number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Input type email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration:
                        InputDecoration(labelText: "Input type Date Time"),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    maxLines: 2,
                    decoration:
                        InputDecoration(labelText: "Input type Multiline"),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration:
                        InputDecoration(labelText: "Input type Address"),
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Input type URL"),
                    keyboardType: TextInputType.url,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Input type text"),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(
                        labelText: "Input type visible password"),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Input type none"),
                    keyboardType: TextInputType.none,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Read only"),
                    readOnly: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    decoration: InputDecoration(labelText: "Show cursor false"),
                    showCursor: false,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password Field"),
                    obscuringCharacter: "*",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const TextField(
                    cursorColor: Colors.red,
                    cursorRadius: Radius.circular(8),
                    cursorWidth: 5,
                    decoration: InputDecoration(labelText: "Cursor"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: TextField(
                    onTap: () {
                      showToast("on clicked");
                    },
                    decoration: const InputDecoration(
                        labelText: "Clicked the text field"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
