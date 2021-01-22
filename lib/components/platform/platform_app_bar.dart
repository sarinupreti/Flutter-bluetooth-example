import 'package:bell_delivery_hub/components/platform/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends PlatformWidget {
  PlatformAppBar({this.leading, this.title, this.actions});
  final Widget leading;
  final Widget title;
  final List<Widget> actions;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      middle: title,
      trailing: Row(
        children: actions,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AppBar(
      leading: leading,
      elevation: 0,
      title: title,
      centerTitle: true,
      actions: actions,
    );
  }
}
