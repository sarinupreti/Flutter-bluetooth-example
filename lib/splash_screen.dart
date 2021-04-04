import 'package:flutter/material.dart';
import 'package:bluetooth_demo/extensions/context_extension.dart';
import 'package:bluetooth_demo/extensions/number_extensions.dart';

class SplashScreen extends StatefulWidget {
  final BuildContext context;

  const SplashScreen({Key key, this.context}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.corePalatte.primaryColor,
      body: Center(
        child: Image.asset(
          "assets/images/bots_logo.png",
          height: 192.flexibleHeight,
          width: 192.flexibleHeight,
        ),
      ),
    );
  }
}
