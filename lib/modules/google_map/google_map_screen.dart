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
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  Set<Polygon> polygons = {};
  List<LatLng> polygonPoints = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Google Map"),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
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
        markers: markers,
        circles: circles,
        polygons: polygons,
        onTap: (LatLangValue) {
          //showToast("Clicked. Location: $LatLangValue");
          setState(() {
            markers.add(
              Marker(
                draggable: true,
                position: LatLng(LatLangValue.latitude, LatLangValue.longitude),
                infoWindow: InfoWindow(
                  title: "Title",
                  snippet: "Description",
                  onTap: () {
                    showToast("clicked");
                  },
                ),
                markerId: const MarkerId("1"),
                onDragStart: (LatLangValue) {
                  showToast("moving...");
                },
                onDragEnd: (LatLangValue) {
                  showToast("Clicked. Location: $LatLangValue");
                },
              ),
            );
          });
          setState(() {
            polygonPoints.add(LatLangValue);
            polygons.add(
              Polygon(
                polygonId: const PolygonId("1"),
                strokeWidth: 3,
                strokeColor: Colors.black,
                fillColor: Colors.blue,
                points: polygonPoints,
              ),
            );
          });
        },
        onLongPress: (LatLangValue) {
          //showToast("Clicked. Location: $LatLang");
          setState(() {
            circles.add(
              Circle(
                circleId: const CircleId("1"),
                radius: 500.0,
                fillColor: Colors.orange,
                strokeColor: Colors.white,
                strokeWidth: 3,
                center: LatLng(LatLangValue.latitude, LatLangValue.longitude),
              ),
            );
          });
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

  void _onMapCreated(GoogleMapController controller) {
    getLastLocationService();
  }
}
