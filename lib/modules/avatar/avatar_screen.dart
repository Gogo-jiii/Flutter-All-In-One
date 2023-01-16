import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}
//backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"),

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Avatar"),
      body: const Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: CircleAvatar(
            backgroundColor: Colors.deepOrangeAccent,
            backgroundImage: AssetImage('assets/images/it_wala.jpg'),
          ),
        ),
      ),
    );
  }
}
