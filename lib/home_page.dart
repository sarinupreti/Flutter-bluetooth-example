import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        child: Text("HOME"),
      ),
    );
  }
}
