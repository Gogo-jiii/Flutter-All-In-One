import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    var loadingPercentage = 0;

    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        appBar: getAppBar(context, "Web View"),
        body: Stack(
          children: [
            WebView(
              onPageStarted: (url) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
              onProgress: (progress) {
                setState(() {
                  loadingPercentage = progress;
                });
              },
              onPageFinished: (url) {
                setState(() {
                  loadingPercentage = 100;
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
            if (loadingPercentage < 100)
              CircularProgressIndicator(
                color: Colors.orange,
                value: loadingPercentage / 100.0,
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
    return false;
  }
}
