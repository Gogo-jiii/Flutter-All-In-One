import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(signInOption: SignInOption.standard
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  // scopes: <String>[
  //   'email',
  //   'https://www.googleapis.com/auth/contacts.readonly',
  // ],
);

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Google SignIn"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                signIn();
              },
              child: const Text("Sign In"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                signOut();
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
      if(await _googleSignIn.isSignedIn()){
        showToast("User: ${_googleSignIn.currentUser?.displayName.toString()}");
        debugPrint("User: ${_googleSignIn.currentUser?.displayName.toString()}");
      }else{
        showToast("Not signed in");
      }

    } catch (error) {
      debugPrint("ERROR..........................");
      debugPrint(error.toString());
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    if(await _googleSignIn.isSignedIn() == false){
      showToast("Logged out.");
    }

  }
}
