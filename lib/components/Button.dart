import 'dart:io';
import 'package:bell_delivery_hub/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final String message;
  final TextAlign textAlign;
  final double fontSize;
  final Color color;
  final Color textColor;
  final Color splashColor;
  final TextStyle style;
  final VoidCallback onPressed;
  final bool isLoading;
  final ShapeBorder shape;
  final double elevation;
  final Icon rightIcon;
  final Color disabledTextColor;
  final Color disabledColor;

  Button(
      {this.width,
      this.height,
      this.shape,
      this.message,
      this.textAlign,
      this.fontSize,
      this.color,
      this.textColor,
      this.splashColor,
      this.style,
      this.onPressed,
      this.elevation,
      this.isLoading = false,
      this.rightIcon,
      this.disabledTextColor,
      this.disabledColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: width ?? double.infinity,
            height: height ?? 50,
            child: RaisedButton(
              shape: shape ??
                  RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
              child: isLoading
                  ? Container(
                      child: Platform.isIOS
                          ? Theme(
                              data: ThemeData(
                                  cupertinoOverrideTheme: CupertinoThemeData(
                                      brightness: context.theme.themeType
                                          ? Brightness.light
                                          : Brightness.dark)),
                              child: CupertinoActivityIndicator())
                          : CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.white),
                            ),
                      width: 24.0,
                      height: 24.0)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              message,
                              textAlign: textAlign ?? TextAlign.center,
                              style: style ??
                                  TextStyle(
                                    fontSize: fontSize ?? 14,
                                  ),
                            ),
                          ),
                        ),
                        rightIcon != null ? rightIcon : Container(),
                      ],
                    ),
              onPressed: onPressed,
              disabledColor: disabledColor ?? Colors.grey,
              color: color ?? AppColors.primaryColor,
              elevation: elevation ?? 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              textColor: textColor ?? AppColors.white,
              disabledElevation: 0,
              disabledTextColor: disabledTextColor ?? Colors.black,
              splashColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
