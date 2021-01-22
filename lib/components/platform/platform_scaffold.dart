import 'package:bell_delivery_hub/components/platform/platform_app_bar.dart';
import 'package:bell_delivery_hub/components/platform/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScaffold extends PlatformWidget {
  PlatformScaffold({this.appBar, this.body, this.drawer});
  final PlatformAppBar appBar;
  final Widget body;
  final Widget drawer;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: appBar.buildCupertinoWidget(context),
      child: body,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: appBar.buildMaterialWidget(context),
      body: body,
    );
  }
}
