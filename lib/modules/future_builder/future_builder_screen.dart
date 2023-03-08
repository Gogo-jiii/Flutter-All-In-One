import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

import 'user_model.dart';

class FutureBuilderScreen extends StatefulWidget {
  const FutureBuilderScreen({Key? key}) : super(key: key);

  @override
  State<FutureBuilderScreen> createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Future builder"),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  debugPrint("1");
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      User? model = snapshot.data as User?;
                      return Text(
                        "Data: ${model?.name}",
                        textAlign: TextAlign.center,
                      );
                    }
                  }
                  return const Text("The data will appear after 5 seconds:",
                      textAlign: TextAlign.center);
                },
                future: getData(),
              ),
              getSizedBox(16),
              getElevatedButton(
                "Click to get the data",
                onPressed: () {
                  getData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<User> getData() async {
    late User model;
    await Future.delayed(const Duration(seconds: 5), () async {
      model = User("IT WALA");
    });
    return model;
  }
}
