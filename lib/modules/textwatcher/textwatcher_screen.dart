import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class TextWatcherScreen extends StatefulWidget {
  const TextWatcherScreen({Key? key}) : super(key: key);

  @override
  State<TextWatcherScreen> createState() => _TextWatcherScreenState();
}

class _TextWatcherScreenState extends State<TextWatcherScreen> {
  late TextEditingController _controller;
  late StringBuffer str;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    str = StringBuffer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Text Watcher"),
      body: Center(
        child: Container(
          margin: setMargin(32),
          child: Column(
            children: [
              getTextField(
                  label: "Enter name",
                  controller: _controller,
                  validate: null,
                  onChanged: (String value) {
                    setState(() {
                      str.clear();
                      str.write(value);
                    });
                  }),
              getSizedBox(16),
              Text("Result: ${str.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
