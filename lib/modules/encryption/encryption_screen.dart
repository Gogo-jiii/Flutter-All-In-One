import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/encryption/encryption_manager.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({Key? key}) : super(key: key);

  @override
  State<EncryptionScreen> createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  final EncryptionManager _encryptionManager = EncryptionManager();
  final TextEditingController _textEditingController = TextEditingController();

  String result = "";

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Encryption"),
      body: Container(
        margin: setMargin(16),
        child: Column(
          children: [
            Text("Result: $result"),
            getSizedBox(16),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: "Enter some text"),
            ),
            getSizedBox(16),
            getElevatedButton(
              "Encrypt AES",
              onPressed: () {
                var data = _textEditingController.text.toString();
                if (data.isEmpty) {
                  showToast("Please enter some text");
                } else {
                  encryptData(data);
                }
              },
            ),
            getElevatedButton(
              "Decrypt AES",
              onPressed: () {
                if (result.isEmpty) {
                  showToast("No text to decrypt.");
                } else {
                  decryptData(result);
                }
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Encrypt SHA256",
              onPressed: () {
                var data = _textEditingController.text.toString();
                if (data.isEmpty) {
                  showToast("Please enter some text");
                } else {
                  encryptSHA256(data);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void encryptData(String data) {
    setState(() {
      result = _encryptionManager.encryptAES(data);
    });
  }

  void decryptData(String encryptedText) {
    setState(() {
      result = _encryptionManager.decryptAES(encryptedText);
    });
  }

  void encryptSHA256(String data) {
    setState(() {
      result = _encryptionManager.encryptSHA256(data);
    });
  }
}
