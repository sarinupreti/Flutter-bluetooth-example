import 'package:flutter/material.dart';
import 'package:bots_demo/extensions/context_extension.dart';

class ErrorScreen extends StatefulWidget {
  final BuildContext context;
  final String message;

  const ErrorScreen({Key key, this.context, this.message}) : super(key: key);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.corePalatte.white,
      body: Center(
          child: Text(
        widget.message,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: context.theme.corePalatte.black),
      )),
    );
  }
}
