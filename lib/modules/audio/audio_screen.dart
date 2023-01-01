import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Audio"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                await player.setSource(AssetSource('sounds/my_music.mp3'));
                player.resume();
              },
              child: const Text("Play Audio"),
            ),
            ElevatedButton(
              onPressed: () {
                player.stop();
              },
              child: const Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}
