import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/alert_dialog/alert_dialog_screen.dart';
import 'package:flutter_all_in_one/modules/theme/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget getListItem(BuildContext context, List<String> data, int index) {
  return Card(
    color: Styles().getCardColor(),
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
      backgroundColor: Styles().getButtonColor(),
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

EdgeInsets setMargin(double value) {
  return EdgeInsets.all(value);
}

Widget getSimpleAlertDialog(String title, String content,
    {required Null Function() onOkPressed,
    required Null Function() onCancelPressed}) {
  return AlertDialog(
    backgroundColor: Styles().getAlertDialogBackgroundColor(),
    elevation: 8,
    scrollable: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Styles().getAlertDialogTextColor(),
      ),
    ),
    content: Text(
      content,
      style: TextStyle(
        color: Styles().getAlertDialogTextColor(),
      ),
    ),
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: onCancelPressed,
        child: const Text("Cancel"),
      ),
      TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: onOkPressed,
        child: const Text("Ok"),
      ),
    ],
  );
}

Widget getOptionAlertDialog(
    {required Null Function() onFirstOptionPressed,
    required Null Function() onSecondOptionPressed}) {
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

Widget getAutoCompleteTextField(_kOptions, onSelected) {
  return Autocomplete<String>(
    onSelected: onSelected,
    fieldViewBuilder:
        (context, textEditingController, focusNode, onFieldSubmitted) =>
            TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Styles().getTextColor()),
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

Widget getDropDownFormField({required Null Function(String? value) onChanged}) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Styles().getBorderColor()),
      ),
    ),
    hint: const Text("Select an Item"),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    elevation: 16,
    icon: Icon(
      Icons.arrow_circle_down,
      color: Styles().getDropDownButtonIconColor(),
    ),
    dropdownColor: Styles().getDropDownButtonBackgroundColor(),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    items: <String>['One', 'Two', 'Three', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
        ),
      );
    }).toList(),
    onChanged: onChanged,
  );
}

Widget getDropDownButton(List<String> items, String dropdownValue,
    {required Null Function(String? value) onChanged}) {
  return DropdownButton(
    dropdownColor: Styles().getDropDownButtonBackgroundColor(),
    borderRadius: BorderRadius.circular(16),
    style: TextStyle(
      color: Styles().getTextColor(),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    underline: Container(
      height: 2,
      color: Colors.white,
    ),
    value: dropdownValue,
    icon: const Icon(Icons.arrow_circle_down),
    elevation: 8,
    items: items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
        ),
      );
    }).toList(),
    onChanged: onChanged,
  );
}

Widget getFormField(
    Key _key,
    String labelText,
    Null Function(dynamic value) onChanged,
    String? Function(dynamic value) validator,
    TextInputType? inputType,
    int? maxLength) {
  return TextFormField(
    key: _key,
    onChanged: onChanged,
    keyboardType: inputType,
    maxLength: maxLength,
    decoration: InputDecoration(labelText: labelText),
    validator: validator,
  );
}

Widget getTextField(
    {required String label,
    required TextEditingController controller,
    required bool? validate,
    required Null Function(String value) onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    controller: controller,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label,
      errorText: (validate != null && validate)
          ? null
          : (validate == null)
              ? null
              : "Field can not be empty",
    ),
  );
}

void showSnackBar(BuildContext context, String msg) {
  SnackBar snackBar = SnackBar(
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(minutes: 1),
    content: Text(
      msg,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    action: SnackBarAction(
      textColor: Colors.black,
      label: 'Close',
      onPressed: () {
        debugPrint("Dismissed.");
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget getSpacer(int value) {
  return Spacer(
    flex: value,
  );
}

Widget getDivider(double value) {
  return Divider(
    thickness: value,
  );
}

void showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
