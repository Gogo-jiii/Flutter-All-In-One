import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Permissions"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getElevatedButton(
              "Check Permissions",
              onPressed: () {
                checkPermissions();
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Ask Permissions",
              onPressed: () {
                askPermissions();
              },
            ),
            getSizedBox(16),
            getDivider(8),
            getSizedBox(16),
            getElevatedButton(
              "Ask Multiple  Permissions",
              onPressed: () {
                askMultiplePermissions();
              },
            ),
          ],
        ),
      ),
    );
  }

  void checkPermissions() async {
    var permission = await Permission.camera.status;
    if (permission.isGranted) {
      showToast("Permissions Already Granted.");
    } else {
      showToast("Permissions Denied.");
    }
  }

  void askPermissions() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      showToast("Permissions Granted.");
    } else {
      showToast("Permissions Denied.");
    }
  }

  void askMultiplePermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.phone,
    ].request();

    if (statuses[Permission.storage] == PermissionStatus.granted) {
      showToast("Storage Permissions Granted.");
    } else if (statuses[Permission.storage] == PermissionStatus.denied) {
      showToast("Storage Permissions Denied.");
    } else if (statuses[Permission.storage] ==
        PermissionStatus.permanentlyDenied) {
      showToast("Storage Permissions Denied Permanently.");
      openAppSettings();
    }

    if (statuses[Permission.phone] == PermissionStatus.granted) {
      showToast("Phone Permissions Granted.");
    } else if (statuses[Permission.phone] == PermissionStatus.denied) {
      showToast("Phone Permissions Denied.");
    } else if (statuses[Permission.phone] ==
        PermissionStatus.permanentlyDenied) {
      showToast("Phone Permissions Denied Permanently.");
      openAppSettings();
    }
  }
}
