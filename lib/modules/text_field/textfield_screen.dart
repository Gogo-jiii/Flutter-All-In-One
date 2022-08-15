import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "Text Field"),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter name"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      maxLength: 10,
                      initialValue: "My name is Vaibhav",
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Enter name",
                        labelStyle: TextStyle(color: Colors.green),
                        helperText: "Helper Text",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Enter name",
                        suffixIcon: Icon(Icons.add_a_photo),
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        labelText: "Enter name",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Hint text",
                        labelText: "Enter name",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorText: "Error Text",
                        labelText: "Enter name",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
