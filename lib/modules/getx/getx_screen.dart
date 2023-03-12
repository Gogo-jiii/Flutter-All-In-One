import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/listview/multiple_items_selection_listview/model_class.dart';
import 'package:get/get.dart';
import '../theme/styles.dart';
import 'model_class.dart';
import 'page1_screen.dart';

class GetXScreen extends StatefulWidget {
  const GetXScreen({Key? key}) : super(key: key);

  @override
  State<GetXScreen> createState() => _GetXScreenState();
}

class _GetXScreenState extends State<GetXScreen> {
  var counter = 0.obs;
  var connect = GetConnect();

  @override
  void initState() {
    Get.put(ModelClass1());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "GetX"),
      body: Container(
        margin: setMargin(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getElevatedButton(
                "Show snackbar",
                onPressed: () {
                  Get.snackbar("Title", "Message",
                      duration: const Duration(seconds: 5),
                      margin: setMargin(8),
                      snackStyle: SnackStyle.FLOATING,
                      shouldIconPulse: true,
                      isDismissible: true,
                      icon: const Icon(Icons.access_alarm),
                      dismissDirection: DismissDirection.horizontal,
                      onTap: (GetSnackBar) {
                    Get.closeCurrentSnackbar();
                  },
                      mainButton: TextButton(
                        onPressed: () {
                          Get.closeCurrentSnackbar();
                        },
                        child: const Text("close"),
                      ),
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Styles().getTextColor());
                },
              ),
              getSizedBox(16),
              getElevatedButton("Go to next page", onPressed: () {
                Get.to(() => Page1Screen(name: "vaibhav"),
                    transition: Transition.zoom,
                    arguments: {"surname": "ghanekar"});
              }),
              getSizedBox(16),
              getElevatedButton("Access data from a singleton class",
                  onPressed: () {
                ModelClass1 _model = Get.find();
                _model.city = "MUMBAI";
                Get.to(() => Page1Screen(name: "vaibhav"));
              }),
              getSizedBox(16),
              getElevatedButton(
                "State management : click to increase the counter below",
                onPressed: () {
                  counter++;
                },
              ),
              getSizedBox(8),
              Obx(
                () => Text(
                  counter.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
              getSizedBox(16),
              getElevatedButton("Validation", onPressed: () {
                Get.snackbar("Info", "Check Log for output",
                    duration: const Duration(seconds: 5),
                    snackPosition: SnackPosition.BOTTOM);
                debugPrint("Is Null or Blank: ${GetUtils.isNullOrBlank("")}");
                debugPrint("Is Blank: ${GetUtils.isBlank("value")}");
                debugPrint("Is Email: ${GetUtils.isEmail("a@gmail.com")}");
                debugPrint("Is Email: ${GetUtils.isEmail("agmail.com")}");
                debugPrint(
                    "Is Length Equal To: ${GetUtils.isLengthEqualTo("1234567890", 10)}");
              }),
              getSizedBox(16),
              getElevatedButton("Http Request", onPressed: () {
                httpRequest();
              }),
              getSizedBox(16),
            ],
          ),
        ),
      ),
    );
  }

  void httpRequest() async {
    const String _url_get = "https://simplifiedcoding.net/demos/marvel";
    const String _url_post = "https://reqres.in/api/users";

    Get.snackbar("Info", "Check Log for output",
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM);

    var getGetRequestResult = await connect.get(_url_get);
    debugPrint(getGetRequestResult.bodyString);

    var getPostRequestResult =
        await connect.post(_url_post, {"name": "Vaibhav"});
    debugPrint(getPostRequestResult.bodyString);
  }
}
