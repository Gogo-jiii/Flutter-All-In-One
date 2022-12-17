import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Camera"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text("Click Image"),
              ),
              const SizedBox(height: 16),
              _setImage(),
            ],
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    var pickedImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = pickedImage;
    });
  }

  Widget _setImage() {
    if (image != null) {
      return Image.file(File(image.path));
    }
    return const Text(
      "Image will appear here.",
      textAlign: TextAlign.center,
    );
  }
}
