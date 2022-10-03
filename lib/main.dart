import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/alert_dialog/alert_dialog_screen.dart';
import 'package:flutter_all_in_one/modules/autocomplete_textfield/autocomplete_textfield_screen.dart';
import 'package:flutter_all_in_one/modules/bottom_appbar/bottom_appbar_screen.dart';
import 'package:flutter_all_in_one/modules/button/button_screen.dart';
import 'package:flutter_all_in_one/modules/button_bar/button_bar_screen.dart';
import 'package:flutter_all_in_one/modules/checkbox/checkbox_screen.dart';
import 'package:flutter_all_in_one/modules/expanded_widget/expanded_widget_screen.dart';
import 'package:flutter_all_in_one/modules/fab/fab_screen.dart';
import 'package:flutter_all_in_one/modules/flexible_widget/felxible_widget_screen.dart';
import 'package:flutter_all_in_one/modules/get_text_from_textfield/get_text_from_textfield_screen.dart';
import 'package:flutter_all_in_one/modules/hello_world/helloworld_screen.dart';
import 'package:flutter_all_in_one/modules/hero/hero_first_screen.dart';
import 'package:flutter_all_in_one/modules/http/http_screen.dart';
import 'package:flutter_all_in_one/modules/image/image_screen.dart';
import 'package:flutter_all_in_one/modules/listview/listview_screen.dart';
import 'package:flutter_all_in_one/modules/log/log_screen.dart';
import 'package:flutter_all_in_one/modules/navigation_drawer/navigation_drawer_screen.dart';
import 'package:flutter_all_in_one/modules/progress_indicator/progress_indicator_screen.dart';
import 'package:flutter_all_in_one/modules/radio_button/radio_button_screen.dart';
import 'package:flutter_all_in_one/modules/rating_bar/rating_bar_screen.dart';
import 'package:flutter_all_in_one/modules/slider/slider_screen.dart';
import 'package:flutter_all_in_one/modules/snackbar/snackbar_screen.dart';
import 'package:flutter_all_in_one/modules/spacer/spacer_screen.dart';
import 'package:flutter_all_in_one/modules/tab_layout/tab_layout_screen.dart';
import 'package:flutter_all_in_one/modules/text_field/textfield_screen.dart';
import 'package:flutter_all_in_one/modules/textwatcher/textwatcher_screen.dart';
import 'package:flutter_all_in_one/modules/timepicker/timepicker_screen.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:flutter_all_in_one/modules/toggle_button/toggle_button_screen.dart';
import 'package:flutter_all_in_one/modules/toolbar_menu/toolbar_menu_screen.dart';
import 'package:flutter_all_in_one/modules/view_pager/view_pager_screen.dart';
import 'package:flutter_all_in_one/modules/visibility/visibility_screen.dart';

import 'modules/common_widgets/common_widgets.dart';
import 'modules/datepicker/date_picker_screen.dart';
import 'modules/divider/divider_screen.dart';
import 'modules/dropdown_button/dropdown_button_screen.dart';
import 'modules/dropdown_formfield/dropdown_formfield_screen.dart';

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
    "Autocomplete TextField",
    "Dropdown Button",
    "Dropdown Form Field",
    "Rating Bar",
    "Alert Dialog",
    "Progress Indicator",
    "Date Picker",
    "Time Picker",
    "Listview",
    "Visibility",
    "Button Bar",
    "Http Request",
    "Floating Action Button",
    "Toolbar Menu",
    "Navigation Drawer",
    "Bottom AppBar",
    "View Pager",
    "Tab Layout"
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
      navigateTo(context, const HelloWorldScreen());
      break;
    case DashboardItemsType.log:
      navigateTo(context, const LogScreen());
      break;
    case DashboardItemsType.snackBar:
      navigateTo(context, const SnackBarScreen());
      break;
    case DashboardItemsType.toast:
      navigateTo(context, const ToastScreen());
      break;
    case DashboardItemsType.button:
      navigateTo(context, const ButtonScreen());
      break;
    case DashboardItemsType.textField:
      navigateTo(context, const TextFieldScreen());
      break;
    case DashboardItemsType.getTextFromTextField:
      navigateTo(context, const GetTextFromTextFieldScreen());
      break;
    case DashboardItemsType.textWatcher:
      navigateTo(context, const TextWatcherScreen());
      break;
    case DashboardItemsType.slider:
      navigateTo(context, const SliderScreen());
      break;
    case DashboardItemsType.image:
      navigateTo(context, const ImageScreen());
      break;
    case DashboardItemsType.checkBox:
      navigateTo(context, const CheckboxScreen());
      break;
    case DashboardItemsType.radioButton:
      navigateTo(context, const RadioButtonScreen());
      break;
    case DashboardItemsType.flexibleWidget:
      navigateTo(context, const FlexibleWidgetScreen());
      break;
    case DashboardItemsType.expandedWidget:
      navigateTo(context, const ExpandedWidgetScreen());
      break;
    case DashboardItemsType.divider:
      navigateTo(context, const DividerScreen());
      break;
    case DashboardItemsType.spacer:
      navigateTo(context, const SpacerScreen());
      break;
    case DashboardItemsType.heroTransition:
      navigateTo(context, const HeroFirstScreen());
      break;
    case DashboardItemsType.toggleButton:
      navigateTo(context, const ToggleButtonScreen());
      break;
    case DashboardItemsType.autocompleteTextField:
      navigateTo(context, const AutoCompleteTextFieldScreen());
      break;
    case DashboardItemsType.dropdownButton:
      navigateTo(context, const DropDownButtonScreen());
      break;
    case DashboardItemsType.dropdownFormField:
      navigateTo(context, const DropDownFormFieldScreen());
      break;
    case DashboardItemsType.ratingBar:
      navigateTo(context, const RatingBarScreen());
      break;
    case DashboardItemsType.alertDialog:
      navigateTo(context, const AlertDialogScreen());
      break;
    case DashboardItemsType.progressIndicator:
      navigateTo(context, const ProgressIndicatorScreen());
      break;
    case DashboardItemsType.datePicker:
      navigateTo(context, const DatePickerScreen());
      break;
    case DashboardItemsType.timePicker:
      navigateTo(context, const TimePickerScreen());
      break;
    case DashboardItemsType.listView:
      navigateTo(context, const ListviewScreen());
      break;
    case DashboardItemsType.visibility:
      navigateTo(context, const VisibilityScreen());
      break;
    case DashboardItemsType.buttonBar:
      navigateTo(context, const ButtonBarScreen());
      break;
    case DashboardItemsType.httpRequest:
      navigateTo(context, const HttpRequestScreen());
      break;
    case DashboardItemsType.fab:
      navigateTo(context, const FabScreen());
      break;
    case DashboardItemsType.toolbarMenu:
      navigateTo(context, const ToolbarMenuScreen());
      break;
    case DashboardItemsType.navigationDrawer:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const NavigationDrawerScreen()));
      break;
    case DashboardItemsType.bottomAppbar:
      navigateTo(context, const BottomAppBarScreen());
      break;
    case DashboardItemsType.viewPager:
      navigateTo(context, const ViewPagerScreen());
      break;
    case DashboardItemsType.tabLayout:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TabLayoutScreen()));
      break;
  }
}

void navigateTo(BuildContext context, StatefulWidget destination) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
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
  autocompleteTextField,
  dropdownButton,
  dropdownFormField,
  ratingBar,
  alertDialog,
  progressIndicator,
  datePicker,
  timePicker,
  listView,
  visibility,
  buttonBar,
  httpRequest,
  fab,
  toolbarMenu,
  navigationDrawer,
  bottomAppbar,
  viewPager,
  tabLayout;
}

DashboardItemsType getListItemType(int index) {
  return DashboardItemsType.values[index];
}
