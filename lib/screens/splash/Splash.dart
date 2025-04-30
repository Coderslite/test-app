import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constants/Constant.dart';
import '../webview/Webview.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  bool isFirstTime = false;
  handleNext() async {
    await Future.delayed(const Duration(seconds: 3));
    // const LoginScreen().launch(context);
    WebviewScreen().launch(context);
  }

  @override
  void initState() {
    handleNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: kPrimary),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                )).center(),
            Text(
              "Daily Profiting",
              style: boldTextStyle(
                color: white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
