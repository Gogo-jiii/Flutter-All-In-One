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
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Result: $result"),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: "Enter some text"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                var data = _textEditingController.text.toString();
                if (data.isEmpty) {
                  showToast("Please enter some text");
                } else {
                  encryptData(data);
                }
              },
              child: const Text("Encrypt AES"),
            ),
            ElevatedButton(
              onPressed: () {
                if (result.isEmpty) {
                  showToast("No text to decrypt.");
                } else {
                  decryptData(result);
                }
              },
              child: const Text("Decrypt AES"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                var data = _textEditingController.text.toString();
                if (data.isEmpty) {
                  showToast("Please enter some text");
                } else {
                  encryptSHA256(data);
                }
              },
              child: const Text("Encrypt SHA256"),
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
