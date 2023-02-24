import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/alert_dialog/alert_dialog_screen.dart';
import 'package:flutter_all_in_one/modules/theme/styles.dart';

Widget getListItem(BuildContext context, List<String> data, int index) {
  return Card(
    color: Styles.getCardColor(),
    borderOnForeground: true,
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Center(
        child: Text(
          data[index],
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget getAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

ElevatedButton getElevatedButton(title, {required Null Function() onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Styles.getButtonColor(),
    ),
    onPressed: onPressed,
    child: Text(title),
  );
}

SizedBox getSizedBox(double value) {
  return SizedBox(
    height: value,
  );
}

EdgeInsets setMargin(double value){
  return EdgeInsets.all(value);
}

Widget getSimpleAlertDialog(String title, String content, {required Null Function() onOkPressed, required Null Function() onCancelPressed}){
  return AlertDialog(
    backgroundColor: Styles.getTextColor(),
    elevation: 8,
    scrollable: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
    title: Text(title),
    content: Text(content),
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          textStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: onCancelPressed,
        child: const Text("Cancel"),
      ),
      TextButton(
        style: TextButton.styleFrom(
          textStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: onOkPressed,
        child: const Text("Ok"),
      ),
    ],
  );
}

Widget getOptionAlertDialog({required Null Function() onFirstOptionPressed, required Null Function() onSecondOptionPressed}){
  return SimpleDialog(
    title: const Text('Select option'),
    children: <Widget>[
      SimpleDialogOption(
        onPressed: onFirstOptionPressed,
        child: const Text('First Option'),
      ),
      SimpleDialogOption(
        onPressed: onSecondOptionPressed,
        child: const Text('Second Option'),
      ),
    ],
  );
}

Widget getAutoCompleteTextField(_kOptions, onSelected){
  return Autocomplete<String>(
    onSelected: onSelected,
    fieldViewBuilder:
        (context, textEditingController, focusNode, onFieldSubmitted) =>
        TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration:  InputDecoration(
            labelStyle: TextStyle(color: Styles.getTextColor()),
            border: const OutlineInputBorder(),
            labelText: "Enter text...",
          ),
        ),
    optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text.isEmpty) {
        return const Iterable<String>.empty();
      }
      return _kOptions.where((String option) {
        return option.contains(textEditingValue.text.toLowerCase());
      });
    },
  );
}