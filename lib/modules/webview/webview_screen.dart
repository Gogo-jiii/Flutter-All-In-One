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

  late AnimationController controller;
  final WebViewController _webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
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
            WebViewWidget(
              controller: _webViewController
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {

                    },
                    onPageStarted: (String url) {

                    },
                    onPageFinished: (String url) {
                      controller.stop(canceled: true);
                    },
                    onWebResourceError: (WebResourceError error) {},
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url.startsWith('https://www.youtube.com/')) {
                        return NavigationDecision.prevent;
                      }
                      return NavigationDecision.navigate;
                    },
                  ),
                )
                ..loadRequest(Uri.parse('https://www.google.com')),
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
