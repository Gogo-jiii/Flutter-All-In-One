import 'dart:async';
import 'dart:isolate';

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
  Location? location = Location();
  LocationData? _locationData;
  final StreamController<UserLocationModel> _locationController =
      StreamController<UserLocationModel>();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  Stream<UserLocationModel> get locationStream => _locationController.stream;
  String locationText = "";

  @override
  Widget build(BuildContext context) {
    return WithForegroundTask(
      child: Scaffold(
        appBar: getAppBar(context, "Location"),
        body: Container(
          margin: setMargin(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _Result(),
                textAlign: TextAlign.center,
              ),
              getSizedBox(16),
              getElevatedButton(
                "Get Last Location",
                onPressed: () {
                  getLastLocation();
                },
              ),
              getSizedBox(16),
              getElevatedButton(
                "Get Continuous Location",
                onPressed: () {
                  getContinuousLocation();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getLastLocation() async {
    _serviceEnabled = (await location?.serviceEnabled())!;
    if (!_serviceEnabled) {
      _serviceEnabled = (await location?.requestService())!;
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = (await location?.hasPermission())!;
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = (await location?.requestPermission())!;
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var _locationDataTemp = await location?.getLocation();

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
    _serviceEnabled = (await location?.serviceEnabled())!;
    if (!_serviceEnabled) {
      _serviceEnabled = (await location?.requestService())!;
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = (await location?.hasPermission())!;
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = (await location?.requestPermission())!;
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location?.onLocationChanged.listen((LocationData currentLocation) async {
      _locationController.add(UserLocationModel(
        currentLocation.latitude,
        currentLocation.longitude,
      ));

      debugPrint("Latitude: ${currentLocation.latitude}");
      debugPrint("Longitude: ${currentLocation.longitude}");

      setState(() {
        _locationData = currentLocation;
      });
    });
  }
}
