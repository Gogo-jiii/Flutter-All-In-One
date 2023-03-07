import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import '../theme/styles.dart';

class FabScreen extends StatefulWidget {
  const FabScreen({Key? key}) : super(key: key);

  @override
  State<FabScreen> createState() => _FabScreenState();
}

class _FabScreenState extends State<FabScreen> {
  var radioButtonList = ["Normal FAB", "Mini FAB", "Extended FAB", "Large FAB"];
  var selectedValue;
  bool _is_extended = true;

  @override
  void initState() {
    super.initState();
    selectedValue = radioButtonList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Floating Action Button"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadioListTile(
              title: Text(radioButtonList[0]),
              value: radioButtonList[0],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              }),
          RadioListTile(
              title: Text(radioButtonList[1]),
              value: radioButtonList[1],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              }),
          RadioListTile(
              title: Text(radioButtonList[2]),
              value: radioButtonList[2],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              }),
          RadioListTile(
              title: Text(radioButtonList[3]),
              value: radioButtonList[3],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              }),
        ],
      ),
      floatingActionButton: getFAB(),
    );
  }

  Widget getFAB() {
    if (selectedValue == radioButtonList[0]) {
      return FloatingActionButton(
        splashColor: Colors.red,
        elevation: 8,
        backgroundColor: Colors.blue,
        onPressed: () {
          showToast("Button clicked.");
        },
        child: Icon(
          Icons.add,
          color: Styles().getIconColor(),
        ),
      );
    } else if (selectedValue == radioButtonList[1]) {
      return FloatingActionButton.small(
        splashColor: Colors.green,
        elevation: 8,
        backgroundColor: Colors.red,
        onPressed: () {
          showToast("Button clicked.");
        },
        child: Icon(
          Icons.add,
          color: Styles().getIconColor(),
        ),
      );
    } else if (selectedValue == radioButtonList[2]) {
      return FloatingActionButton.extended(
        isExtended: _is_extended,
        icon: Icon(
          Icons.add,
          color: Styles().getIconColor(),
        ),
        splashColor: Colors.white,
        elevation: 8,
        backgroundColor: Colors.amber,
        onPressed: () {
          setState(() {
            _is_extended = !_is_extended;
          });
          //showToast("Button clicked.");
        },
        label: Text(
          "Label",
          style: TextStyle(color: Styles().getLabelColor()),
        ),
      );
    } else if (selectedValue == radioButtonList[3]) {
      return FloatingActionButton.large(
        splashColor: Colors.white,
        elevation: 8,
        backgroundColor: Colors.green,
        onPressed: () {
          showToast("Button clicked.");
        },
        child: Icon(
          Icons.add,
          color: Styles().getIconColor(),
        ),
      );
    }
    return FloatingActionButton(
      splashColor: Colors.red,
      elevation: 8,
      backgroundColor: Colors.blue,
      onPressed: () {
        showToast("Button clicked.");
      },
      child: Icon(
        Icons.add,
        color: Styles().getIconColor(),
      ),
    );
  }
}
