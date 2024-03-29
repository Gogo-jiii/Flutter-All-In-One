import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/alert_dialog/alert_dialog_screen.dart';
import 'package:flutter_all_in_one/modules/autocomplete_textfield/autocomplete_textfield_screen.dart';
import 'package:flutter_all_in_one/modules/bottom_appbar/bottom_appbar_screen.dart';
import 'package:flutter_all_in_one/modules/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter_all_in_one/modules/bottom_sheet/bottom_sheet_screen.dart';
import 'package:flutter_all_in_one/modules/button/button_screen.dart';
import 'package:flutter_all_in_one/modules/button_bar/button_bar_screen.dart';
import 'package:flutter_all_in_one/modules/camera/camera_screen.dart';
import 'package:flutter_all_in_one/modules/checkbox/checkbox_screen.dart';
import 'package:flutter_all_in_one/modules/chips/chips_screen.dart';
import 'package:flutter_all_in_one/modules/clipboard/clipboard_screen.dart';
import 'package:flutter_all_in_one/modules/encryption/encryption_screen.dart';
import 'package:flutter_all_in_one/modules/expanded_widget/expanded_widget_screen.dart';
import 'package:flutter_all_in_one/modules/fab/fab_screen.dart';
import 'package:flutter_all_in_one/modules/flexible_widget/felxible_widget_screen.dart';
import 'package:flutter_all_in_one/modules/foreground_task/foreground_task_screen.dart';
import 'package:flutter_all_in_one/modules/form/form_screen.dart';
import 'package:flutter_all_in_one/modules/future_builder/future_builder_screen.dart';
import 'package:flutter_all_in_one/modules/get_text_from_textfield/get_text_from_textfield_screen.dart';
import 'package:flutter_all_in_one/modules/google_map/google_map_screen.dart';
import 'package:flutter_all_in_one/modules/hello_world/helloworld_screen.dart';
import 'package:flutter_all_in_one/modules/hero/hero_first_screen.dart';
import 'package:flutter_all_in_one/modules/stepper/horizontal_stepper_screen.dart';
import 'package:flutter_all_in_one/modules/http/http_screen.dart';
import 'package:flutter_all_in_one/modules/image/image_screen.dart';
import 'package:flutter_all_in_one/modules/image_picker/image_picker_screen.dart';
import 'package:flutter_all_in_one/modules/interactive_viewer/interactive_viewer_screen.dart';
import 'package:flutter_all_in_one/modules/listview/listview_screen.dart';
import 'package:flutter_all_in_one/modules/location/location_screen.dart';
import 'package:flutter_all_in_one/modules/log/log_screen.dart';
import 'package:flutter_all_in_one/modules/navigation_drawer/navigation_drawer_screen.dart';
import 'package:flutter_all_in_one/modules/notification/notification_screen.dart';
import 'package:flutter_all_in_one/modules/permissions/permissions_screen.dart';
import 'package:flutter_all_in_one/modules/picture_in_picture/picture_in_picture_screen.dart';
import 'package:flutter_all_in_one/modules/progress_indicator/progress_indicator_screen.dart';
import 'package:flutter_all_in_one/modules/provider/provider_screen.dart';
import 'package:flutter_all_in_one/modules/radio_button/radio_button_screen.dart';
import 'package:flutter_all_in_one/modules/rating_bar/rating_bar_screen.dart';
import 'package:flutter_all_in_one/modules/scrolling_toolbar/scrolling_toolbar_screen.dart';
import 'package:flutter_all_in_one/modules/share_data/share_data_screen.dart';
import 'package:flutter_all_in_one/modules/shared_preference/shared_preference_screen.dart';
import 'package:flutter_all_in_one/modules/slider/slider_screen.dart';
import 'package:flutter_all_in_one/modules/snackbar/snackbar_screen.dart';
import 'package:flutter_all_in_one/modules/spacer/spacer_screen.dart';
import 'package:flutter_all_in_one/modules/sqlite/sqlite_screen.dart';
import 'package:flutter_all_in_one/modules/tab_layout/tab_layout_screen.dart';
import 'package:flutter_all_in_one/modules/text_field/textfield_screen.dart';
import 'package:flutter_all_in_one/modules/textwatcher/textwatcher_screen.dart';
import 'package:flutter_all_in_one/modules/timepicker/timepicker_screen.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:flutter_all_in_one/modules/toggle_button/toggle_button_screen.dart';
import 'package:flutter_all_in_one/modules/toolbar_menu/toolbar_menu_screen.dart';
import 'package:flutter_all_in_one/modules/view_pager/view_pager_screen.dart';
import 'package:flutter_all_in_one/modules/visibility/visibility_screen.dart';
import 'package:flutter_all_in_one/modules/webview/webview_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'modules/avatar/avatar_screen.dart';
import 'modules/common_widgets/common_widgets.dart';
import 'modules/datepicker/date_picker_screen.dart';
import 'modules/divider/divider_screen.dart';
import 'modules/dropdown_button/dropdown_button_screen.dart';
import 'modules/dropdown_formfield/dropdown_formfield_screen.dart';
import 'modules/file_picker/file_picker_screen.dart';
import 'modules/finger_print_auth/finger_print_auth_screen.dart';
import 'modules/getx/getx_screen.dart';
import 'modules/google_signin/google_signin_screen.dart';
import 'modules/hive database/hive_database_screen.dart';
import 'modules/provider/provider_model.dart';
import 'modules/stepper/vertical_stepper_screen.dart';
import 'modules/storage/storage_screen.dart';
import 'modules/system_bars/system_bars_screen.dart';
import 'modules/theme/dark_theme_provider.dart';
import 'modules/theme/styles.dart';
import 'modules/workmanager/workmanager_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ProviderModel();
        }),
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: Styles().themeData(themeChangeProvider.darkTheme, context),
            home: const MyHomePage(title: 'Flutter All in One'),
          );
        },
      ),
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
    "Form",
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
    "Tab Layout",
    "Bottom Navigation",
    "Bottom Sheet",
    "Interactive Viewer",
    "System Bars",
    "Chips",
    "Clipboard",
    "Scrolling Toolbar",
    "Future builder",
    "Shared Preference",
    "SQLite",
    "Permissions",
    "Provider",
    "Notification",
    "Finger Print Auth",
    "Storage",
    "File Picker",
    "Share Data",
    "Picture in Picture",
    "Encryption",
    "Web View",
    "Image Picker",
    "Camera",
    "Work Manager",
    "Foreground Task",
    "Location",
    "Avatar",
    "Vertical Stepper",
    "Horizontal Stepper",
    "Hive Database",
    "Google Map",
    "Google SignIn",
    "GetX",
  ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                child: StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setState) {
                    return CheckboxListTile(
                        title: const Text("Dark Theme"),
                        value: themeChange.darkTheme,
                        onChanged: (value) {
                          setState(() {
                            themeChange.darkTheme = value!;
                            Navigator.of(context).pop();
                          });
                        });
                  },
                ),
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: getListItem(context, data, index),
                onTap: () {
                  navigate(context, index);
                });
          }),
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
    case DashboardItemsType.form:
      navigateTo(context, const FormScreen());
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
    case DashboardItemsType.bottomNavigation:
      navigateTo(context, const BottomNavigationScreen());
      break;
    case DashboardItemsType.bottomSheet:
      navigateTo(context, const BottomSheetScreen());
      break;
    case DashboardItemsType.interactiveViewer:
      navigateTo(context, const InteractiveViewerScreen());
      break;
    case DashboardItemsType.systemBars:
      navigateTo(context, const SystemBarsScreen());
      break;
    case DashboardItemsType.chips:
      navigateTo(context, const ChipScreen());
      break;
    case DashboardItemsType.clipBoard:
      navigateTo(context, ClipBoardScreen());
      break;
    case DashboardItemsType.scrollingToolbar:
      navigateTo(context, ScrollingToolbarScreen());
      break;
    case DashboardItemsType.futureBuilder:
      navigateTo(context, const FutureBuilderScreen());
      break;
    case DashboardItemsType.sharedPreference:
      navigateTo(context, const SharedPreferenceScreen());
      break;
    case DashboardItemsType.sqlite:
      navigateTo(context, const SqliteScreen());
      break;
    case DashboardItemsType.permissions:
      navigateTo(context, const PermissionsScreen());
      break;
    case DashboardItemsType.provider:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProviderScreen()));
      break;
    case DashboardItemsType.notification:
      navigateTo(context, const NotificationScreen());
      break;
    case DashboardItemsType.fingerPrintAuth:
      navigateTo(context, const FingerPrintAuthScreen());
      break;
    case DashboardItemsType.storage:
      navigateTo(context, const StorageScreen());
      break;
    case DashboardItemsType.filePicker:
      navigateTo(context, const FilePickerScreen());
      break;
    case DashboardItemsType.shareData:
      navigateTo(context, const ShareDataScreen());
      break;
    case DashboardItemsType.pictureInPicture:
      navigateTo(context, const PictureInPictureScreen());
      break;
    case DashboardItemsType.encryption:
      navigateTo(context, const EncryptionScreen());
      break;
    case DashboardItemsType.webView:
      navigateTo(context, const WebViewScreen());
      break;
    case DashboardItemsType.imagePicker:
      navigateTo(context, const ImagePickerScreen());
      break;
    case DashboardItemsType.camera:
      navigateTo(context, const CameraScreen());
      break;
    case DashboardItemsType.workManager:
      navigateTo(context, const WorkManagerScreen());
      break;
    case DashboardItemsType.foregroundTask:
      navigateTo(context, const ForegroundTaskScreen());
      break;
    case DashboardItemsType.location:
      navigateTo(context, const LocationScreen());
      break;
    case DashboardItemsType.avatar:
      navigateTo(context, const AvatarScreen());
      break;
    case DashboardItemsType.verticalStepper:
      navigateTo(context, const VerticalStepperScreen());
      break;
    case DashboardItemsType.horizontalStepper:
      navigateTo(context, const HorizontalStepperScreen());
      break;
    case DashboardItemsType.hiveDatabase:
      navigateTo(context, const HiveDatabaseScreen());
      break;
    case DashboardItemsType.googleMap:
      navigateTo(context, const GoogleMapScreen());
      break;
    case DashboardItemsType.googleSignIn:
      navigateTo(context, const GoogleSignInScreen());
      break;
    case DashboardItemsType.getX:
      navigateTo(context, const GetXScreen());
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
  form,
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
  tabLayout,
  bottomNavigation,
  bottomSheet,
  interactiveViewer,
  systemBars,
  chips,
  clipBoard,
  scrollingToolbar,
  futureBuilder,
  sharedPreference,
  sqlite,
  permissions,
  provider,
  notification,
  fingerPrintAuth,
  storage,
  filePicker,
  shareData,
  pictureInPicture,
  encryption,
  webView,
  imagePicker,
  camera,
  workManager,
  foregroundTask,
  location,
  avatar,
  verticalStepper,
  horizontalStepper,
  hiveDatabase,
  googleMap,
  googleSignIn,
  getX,
}

DashboardItemsType getListItemType(int index) {
  return DashboardItemsType.values[index];
}
