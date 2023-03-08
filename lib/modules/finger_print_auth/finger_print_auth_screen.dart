import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintAuthScreen extends StatefulWidget {
  const FingerPrintAuthScreen({Key? key}) : super(key: key);

  @override
  State<FingerPrintAuthScreen> createState() => _FingerPrintAuthScreenState();
}

class _FingerPrintAuthScreenState extends State<FingerPrintAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Finger Print Authentication"),
      body: Center(
        child: getElevatedButton(
          "Authenticate Finger Print",
          onPressed: () {
            authenticate();
          },
        ),
      ),
    );
  }

  void authenticate() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    if (!canAuthenticate) {
      showToast("Biometric authentication is not available on this device.");
      return;
    }

    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) {
      showToast("Biometrics are not enrolled on this device");
      return;
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.fingerprint)) {
      bool isAuthentic = await auth.authenticate(
          localizedReason:
              "Please authenticate the fingerprint to proceed further.");
      if (isAuthentic) {
        showToast("Authentication successful");
      } else {
        showToast("Authentication failed.");
      }
    }
  }
}
