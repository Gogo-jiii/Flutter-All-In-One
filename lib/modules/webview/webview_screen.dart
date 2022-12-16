import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen>
    with TickerProviderStateMixin {
  late WebViewController _webViewController;
  late AnimationController controller;
  var isProgressIndicatorVisible = true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        appBar: getAppBar(context, "Web View"),
        body: Stack(
          children: [
            WebView(
              onPageStarted: (value) {
                setState(() {
                  isProgressIndicatorVisible = true;
                });
              },
              onPageFinished: (url) {
                setState(() {
                  isProgressIndicatorVisible = false;
                });
              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
                _webViewController.canGoBack();
                _webViewController.canGoForward();
              },
              zoomEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://www.google.com',
            ),
            Visibility(
              visible: isProgressIndicatorVisible,
              child: LinearProgressIndicator(
                color: Colors.orange,
                value: controller.value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBack() async {
    var value =
        await _webViewController.canGoBack(); // check webview can go back
    if (value) {
      _webViewController.goBack(); // perform webview back operation
      return false;
    }
    return true;
  }
}
