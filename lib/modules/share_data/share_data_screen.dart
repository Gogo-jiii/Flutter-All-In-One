import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:share_extend/share_extend.dart';

class ShareDataScreen extends StatefulWidget {
  const ShareDataScreen({Key? key}) : super(key: key);

  @override
  State<ShareDataScreen> createState() => _ShareDataScreenState();
}

class _ShareDataScreenState extends State<ShareDataScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Share Data"),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: "Enter data"),
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
                  shareData(data.toString());
                }
              },
              child: const Text("Share Text"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                shareFile();
              },
              child: const Text("Share File"),
            ),
          ],
        ),
      ),
    );
  }

  void shareData(String data) {
    ShareExtend.share(data, "text",
        sharePanelTitle: "Title", subject: "Subject", extraText: "Extra Text");
  }

  void shareFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String? path = result.files.single.path;
      ShareExtend.share(path!, "file");
    }
  }
}
