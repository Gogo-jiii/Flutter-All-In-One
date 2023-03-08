import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/provider/provider_model.dart';
import 'package:provider/provider.dart';

import '../common_widgets/common_widgets.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  late ProviderModel providerModel;

  @override
  Widget build(BuildContext context) {
    providerModel = Provider.of<ProviderModel>(context, listen: false);

    return Scaffold(
      appBar: getAppBar(context, "Provider"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Consumer<ProviderModel>(
                  builder: (BuildContext context, value, Widget? child) {
                return Text("The Count is : ${value.counter}");
              }),
              getSizedBox(16),
              getElevatedButton(
                "Increase Counter",
                onPressed: () {
                  providerModel.incrementCounter();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
