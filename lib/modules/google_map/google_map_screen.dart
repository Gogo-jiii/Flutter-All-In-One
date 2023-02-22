import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../toast/toast_screen.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Location? location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    getLastLocationService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Google Map"),
      body: GoogleMap(
        compassEnabled: true,
        mapToolbarEnabled: true,
        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        layoutDirection: TextDirection.ltr,
        indoorViewEnabled: true,
        trafficEnabled: true,
        buildingsEnabled: true,
        onTap: (LatLang) {
          showToast("Clicked. Location: $LatLang");
        },
        onLongPress: (LatLang) {
          showToast("Clicked. Location: $LatLang");
        },
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
      ),
    );
  }

  Future<LocationData?> getLastLocationService() async {
    _serviceEnabled = (await location?.serviceEnabled())!;
    if (!_serviceEnabled) {
      _serviceEnabled = (await location?.requestService())!;
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = (await location?.hasPermission())!;
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = (await location?.requestPermission())!;
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location?.getLocation();
  }
}
