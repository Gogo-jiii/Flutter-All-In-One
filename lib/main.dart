import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/autocomplete_textfield/autocomplete_textfield_screen.dart';
import 'package:flutter_all_in_one/modules/button/button_screen.dart';
import 'package:flutter_all_in_one/modules/checkbox/checkbox_screen.dart';
import 'package:flutter_all_in_one/modules/expanded_widget/expanded_widget_screen.dart';
import 'package:flutter_all_in_one/modules/flexible_widget/felxible_widget_screen.dart';
import 'package:flutter_all_in_one/modules/get_text_from_textfield/get_text_from_textfield_screen.dart';
import 'package:flutter_all_in_one/modules/hello_world/helloworld_screen.dart';
import 'package:flutter_all_in_one/modules/hero/hero_first_screen.dart';
import 'package:flutter_all_in_one/modules/image/image_screen.dart';
import 'package:flutter_all_in_one/modules/log/log_screen.dart';
import 'package:flutter_all_in_one/modules/radio_button/radio_button_screen.dart';
import 'package:flutter_all_in_one/modules/slider/slider_screen.dart';
import 'package:flutter_all_in_one/modules/snackbar/snackbar_screen.dart';
import 'package:flutter_all_in_one/modules/spacer/spacer_screen.dart';
import 'package:flutter_all_in_one/modules/text_field/textfield_screen.dart';
import 'package:flutter_all_in_one/modules/textwatcher/textwatcher_screen.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:flutter_all_in_one/modules/toggle_button/toggle_button_screen.dart';

import 'modules/common_widgets/common_widgets.dart';
import 'modules/divider/divider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter All in One'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [
    "Hello World",
    "Log",
    "Snack Bar",
    "Toast",
    "Button",
    "Text Field",
    "Get Text From Text Field",
    "Text Watcher",
    "Slider",
    "Image",
    "Checkbox",
    "Radio Button",
    "Flexible Widget",
    "Expanded Widget",
    "Divider",
    "Spacer",
    "Hero Transition",
    "Toggle Button",
    "Autocomplete TextField"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 10,
        trackVisibility: true,
        interactive: true,
        radius: const Radius.circular(10),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: getListItem(context, data, index),
                  onTap: () {
                    navigate(context, index);
                  });
            }),
      ),
    );
  }
}

void navigate(BuildContext context, int index) {
  var type = getListItemType(index);
  switch (type) {
    case DashboardItemsType.helloWorld:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HelloWorldScreen()));
      break;
    case DashboardItemsType.log:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LogScreen()));
      break;
    case DashboardItemsType.snackBar:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SnackBarScreen()));
      break;
    case DashboardItemsType.toast:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ToastScreen()));
      break;
    case DashboardItemsType.button:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ButtonScreen()));
      break;
    case DashboardItemsType.textField:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TextFieldScreen()));
      break;
    case DashboardItemsType.getTextFromTextField:
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const GetTextFromTextFieldScreen()));
      break;
    case DashboardItemsType.textWatcher:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const TextWatcherScreen()));
      break;
    case DashboardItemsType.slider:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SliderScreen()));
      break;
    case DashboardItemsType.image:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ImageScreen()));
      break;
    case DashboardItemsType.checkBox:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const CheckboxScreen()));
      break;
    case DashboardItemsType.radioButton:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const RadioButtonScreen()));
      break;
    case DashboardItemsType.flexibleWidget:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const FlexibleWidgetScreen()));
      break;
    case DashboardItemsType.expandedWidget:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ExpandedWidgetScreen()));
      break;
    case DashboardItemsType.divider:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const DividerScreen()));
      break;
    case DashboardItemsType.spacer:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SpacerScreen()));
      break;
    case DashboardItemsType.heroTransition:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HeroFirstScreen()));
      break;
    case DashboardItemsType.toggleButton:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ToggleButtonScreen()));
      break;
    case DashboardItemsType.autocompleteTextField:
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const AutoCompleteTextFieldScreen()));
      break;
  }
}

enum DashboardItemsType {
  helloWorld,
  log,
  snackBar,
  toast,
  button,
  textField,
  getTextFromTextField,
  textWatcher,
  slider,
  image,
  checkBox,
  radioButton,
  flexibleWidget,
  expandedWidget,
  divider,
  spacer,
  heroTransition,
  toggleButton,
  autocompleteTextField;
}

DashboardItemsType getListItemType(int index) {
  return DashboardItemsType.values[index];
}
