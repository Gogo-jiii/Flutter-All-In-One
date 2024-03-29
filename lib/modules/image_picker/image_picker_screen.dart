import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePicker _picker = ImagePicker();

  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Image Picker"),
      body: Container(
        margin: setMargin(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getElevatedButton(
              "Pick Image",
              onPressed: () {
                pickImage();
              },
            ),
            getSizedBox(16),
            _setImage(),
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    var pickedImage = await _picker.pickImage(source: ImageSource.gallery);
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
