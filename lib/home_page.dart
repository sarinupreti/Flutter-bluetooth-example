import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomePage extends StatefulWidget {
  final WebsiteData websiteData;

  const HomePage({Key key, this.websiteData}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: WebsafeSvg.asset("assets/images/logo_app_bar.svg"),
      ),
    );
  }
}
