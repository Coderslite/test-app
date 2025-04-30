import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/Constant.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController controller;
  bool isLoading = true;
  int progres = 0;

  handleInit() async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // onProgress: (int progress) {
          //   // Update loading bar.
          //   progres = progress;
          //   setState(() {});
          // },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://dailyprofiting.com/login.php'));
  }

  @override
  void initState() {
    handleInit();
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (await controller.canGoBack()) {
      // Go back in webview history if possible
      await controller.goBack();
      return false; // Prevents exiting the screen
    } else {
      return true; // Exits the screen if there's no page to go back to
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: kPrimary,
          body: 
          // progres < 100
          //     ? Loader(
          //         // value: progres.toDouble(),
          //         color: white,
          //       )
          //     : 
              WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
