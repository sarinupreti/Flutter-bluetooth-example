import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

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
      backgroundColor: context.theme.corePalatte.black,
      body: Center(
        child: context.theme.themeType
            ? Image.asset(
                "assets/images/logo_white.png",
                height: 192.flexibleHeight,
                width: 192.flexibleHeight,
              )
            : Image.asset(
                "assets/images/l.png",
                height: 192.flexibleHeight,
                width: 192.flexibleHeight,
              ),
      ),
    );
  }
}
