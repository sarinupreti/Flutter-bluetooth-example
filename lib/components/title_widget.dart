import 'package:flutter/material.dart';
import 'package:bots_demo/extensions/number_extensions.dart';
import 'package:bots_demo/extensions/context_extension.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Alignment titleAlignment;
  final Function() onTap;

  const TitleWidget(
      {Key key,
      this.title,
      this.titleAlignment = Alignment.centerLeft,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.flexibleWidth),
        child: Align(
          alignment: titleAlignment,
          child: Text("$title",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: context.theme.themeType
                      ? context.theme.textColor
                      : context.theme.corePalatte.greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.flexibleFontSize)),
        ),
      ),
    );
  }
}
