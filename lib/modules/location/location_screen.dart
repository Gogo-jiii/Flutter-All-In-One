import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/location/user_location_model.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _locationData;

  final StreamController<UserLocationModel> _locationController =
      StreamController<UserLocationModel>();

  Stream<UserLocationModel> get locationStream => _locationController.stream;

  @override
  void initState() {
    super.initState();
    _initForegroundTask();
  }

  void _initForegroundTask() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'notification_channel_id',
        channelName: 'Foreground Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        isOnceEvent: false,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WithForegroundTask(
      child: Scaffold(
        appBar: getAppBar(context, "Location"),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _Result(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  getLastLocation();
                },
                child: const Text("Get Last Location"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  getContinuousLocation();
                },
                child: const Text("Get Continuous Location"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  getLocationInBackground();
                },
                child: const Text("Get Background Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getLastLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var _locationDataTemp = await location.getLocation();

    setState(() {
      _locationData = _locationDataTemp;
    });
  }

  String _Result() {
    if (_locationData == null) {
      return "Result:";
    }
    return "Result:\nLatitude:${_locationData?.latitude}\nLongitude:${_locationData?.longitude}";
  }

  void getContinuousLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) async {
      if (currentLocation != null) {
        _locationController.add(UserLocationModel(
          currentLocation.latitude,
          currentLocation.longitude,
        ));

        debugPrint("Latitude: ${currentLocation.latitude}");
        debugPrint("Longitude: ${currentLocation.longitude}");

        setState(() {
          _locationData = currentLocation;
        });
      }
    });
  }

  void getLocationInBackground() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    FlutterForegroundTask.startService(
      notificationTitle: "Location",
      notificationText: "Please wait...",
    );

    location.onLocationChanged.listen((LocationData currentLocation) async {
      if (currentLocation != null) {
        _locationController.add(UserLocationModel(
          currentLocation.latitude,
          currentLocation.longitude,
        ));

        debugPrint("Latitude: ${currentLocation.latitude}");
        debugPrint("Longitude: ${currentLocation.longitude}");

        FlutterForegroundTask.isRunningService.then((value) => {
              FlutterForegroundTask.updateService(
                  notificationText:
                      "Latitude: ${currentLocation.latitude}\nLongitude: ${currentLocation.longitude}")
            });
      }
    });

    Future.delayed(const Duration(seconds: 1), () async {
      if (_locationData == null) {
        await location.getLocation();
      }
    });
  }
}
