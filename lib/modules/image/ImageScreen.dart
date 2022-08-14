import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Image"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                "Image from assests folder",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/it_wala.jpg',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 16),
              const Text(
                "Image from network",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 16),
              const Text(
                "Image with placeholder",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              FadeInImage.assetNetwork(
                  height: 200,
                  width: 200,
                  placeholder: 'assets/images/it_wala.jpg',
                  image:
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
