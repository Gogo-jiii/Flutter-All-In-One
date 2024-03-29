import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class AutoCompleteTextFieldScreen extends StatefulWidget {
  const AutoCompleteTextFieldScreen({Key? key}) : super(key: key);

  @override
  State<AutoCompleteTextFieldScreen> createState() =>
      _AutoCompleteTextfieldScreenState();
}

class _AutoCompleteTextfieldScreenState
    extends State<AutoCompleteTextFieldScreen> {
  final List<String> _kOptions = [
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Autocomplete TextField"),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: getAutoCompleteTextField(
            _kOptions,
            (String selection) {
              showToast("Selected : $selection");
            },
          ),
        ),
      ),
    );
  }
}
