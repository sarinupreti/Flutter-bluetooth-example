import 'dart:io';

import 'package:bell_delivery_hub/components/platform/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialog extends PlatformWidget {
  PlatformAlertDialog({
    @required this.title,
    @required this.content,
    this.cancelText,
    @required this.confirmText,
    @required this.onPressed,
  })  : assert(title != null),
        assert(content != null),
        assert(confirmText != null);

  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback onPressed;

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.headline6),
      content: Text(content, style: Theme.of(context).textTheme.subtitle1),
      actions: _actions(
          context, cancelText?.toUpperCase(), confirmText.toUpperCase()),
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _actions(context, cancelText, confirmText),
    );
  }

  List<Widget> _actions(
      BuildContext context, String cancelText, String confirmText) {
    var actions = <Widget>[];
    if (cancelText != null) {
      actions.add(PlatformAlertDialogAction(
        child: Text(cancelText, style: Theme.of(context).textTheme.subtitle2),
        onPressed: () => _dismiss(context, false),
      ));
    }
    actions.add(PlatformAlertDialogAction(
      child: Text(confirmText, style: Theme.of(context).textTheme.subtitle2),
      onPressed: () => onPressed(),
    ));
    return actions;
  }

  Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: !Platform.isIOS,
      builder: (context) => this,
    );
    // showDialog returns null if the dialog has been dismissed with the back
    // button on Android.
    // here we ensure that we return only true or false
    return Future.value(result ?? false);
  }

  void _dismiss(BuildContext context, bool value) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  PlatformAlertDialogAction({this.child, this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  FlatButton buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }
}
