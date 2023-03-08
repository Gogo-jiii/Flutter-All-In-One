import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/main.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();
    initNotificationSettings();
  }

  void initNotificationSettings() {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
    var initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onNotificationClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Notification"),
      body: Container(
        margin: setMargin(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getElevatedButton(
              "Show Normal Notification",
              onPressed: () {
                showNormalNotification();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show On Going Notification",
              onPressed: () {
                showOnGoingNotification();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Large Icon Notification",
              onPressed: () {
                showLargeIconNotification();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Notification With Timeout",
              onPressed: () {
                showNotificationWithTimeout();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Notification With Action Button",
              onPressed: () {
                showNotificationWithActionButton();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Notification With Text Button",
              onPressed: () {
                showNotificationWithTextButton();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Big Text Notification",
              onPressed: () {
                showBigTextNotification();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Notification With Infinite Progress",
              onPressed: () {
                showInfiniteProgressNotification();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Notification With Progress",
              onPressed: () {
                showProgressNotification();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Notification With Big Picture",
              onPressed: () {
                showBigPictureNotification();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Notification With On Click Event",
              onPressed: () {
                showNotificationWithClickEvent();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showNormalNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        ticker: "Ticker...",
        autoCancel: true,
        subText: "This is subtext",
        colorized: true);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showOnGoingNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "a",
      "b",
      channelDescription: "c",
      importance: Importance.max,
      color: Colors.green,
      priority: Priority.max,
      enableVibration: true,
      enableLights: true,
      autoCancel: false,
      ongoing: true,
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'Foreground Notification',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showLargeIconNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "a",
      "b",
      channelDescription: "c",
      importance: Importance.max,
      color: Colors.green,
      priority: Priority.max,
      enableVibration: true,
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap('@drawable/it_wala'),
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'Large Icon Notification',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showNotificationWithTimeout() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        timeoutAfter: 5000);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showNotificationWithActionButton() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        autoCancel: true,
        subText: "This is subtext",
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction(
            "0",
            "Action 1",
            icon: DrawableResourceAndroidBitmap('@drawable/it_wala'),
          )
        ]);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showNotificationWithTextButton() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        autoCancel: true,
        subText: "This is subtext",
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction("1", "Enter Text",
              icon: DrawableResourceAndroidBitmap('@drawable/it_wala'),
              inputs: <AndroidNotificationActionInput>[
                AndroidNotificationActionInput(label: "Enter a message"),
              ])
        ]);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showBigTextNotification() async {
    const BigTextStyleInformation bigTextStyleInformation =
        BigTextStyleInformation(
      'Lorem <i>ipsum dolor sit</i> amet, consectetur <b>adipiscing elit</b>, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      htmlFormatBigText: true,
      contentTitle: 'overridden <b>big</b> content title',
      htmlFormatContentTitle: true,
      summaryText: 'summary <i>text</i>',
      htmlFormatSummaryText: true,
    );

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        ticker: "Ticker...",
        autoCancel: true,
        subText: "This is subtext",
        colorized: true,
        styleInformation: bigTextStyleInformation);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showInfiniteProgressNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        ticker: "Ticker...",
        autoCancel: true,
        subText: "This is subtext",
        colorized: true,
        showProgress: true,
        indeterminate: true);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showProgressNotification() async {
    final int progressId = 100;
    const int maxProgress = 5;

    for (int i = 0; i <= maxProgress; i++) {
      await Future<void>.delayed(const Duration(seconds: 1), () async {
        final AndroidNotificationDetails androidNotificationDetails =
            AndroidNotificationDetails('progress channel', 'progress channel',
                channelDescription: 'progress channel description',
                channelShowBadge: false,
                importance: Importance.max,
                priority: Priority.high,
                onlyAlertOnce: true,
                showProgress: true,
                maxProgress: maxProgress,
                progress: i);
        final NotificationDetails notificationDetails =
            NotificationDetails(android: androidNotificationDetails);
        await flutterLocalNotificationsPlugin.show(
            progressId,
            'progress notification title',
            'progress notification body',
            notificationDetails,
            payload: 'item x');
      });
    }
  }

  void showBigPictureNotification() async {
    const BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
            DrawableResourceAndroidBitmap('@drawable/it_wala'));

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        ticker: "Ticker...",
        autoCancel: true,
        subText: "This is subtext",
        colorized: true,
        styleInformation: bigPictureStyleInformation);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void showNotificationWithClickEvent() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "a", "b",
        channelDescription: "c",
        importance: Importance.max,
        color: Colors.green,
        priority: Priority.max,
        enableVibration: true,
        enableLights: true,
        ticker: "Ticker...",
        autoCancel: true,
        subText: "This is subtext",
        colorized: true);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'On-click',
    );
  }

  void _onNotificationClicked(NotificationResponse details) {
    if (details.payload.toString() == "On-click") {
      showToast("Clicked");
      Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
    }
  }
}
