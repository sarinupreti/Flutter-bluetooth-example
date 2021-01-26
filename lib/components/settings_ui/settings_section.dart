import 'package:bell_delivery_hub/components/settings_ui/abstract_section.dart';
import 'package:bell_delivery_hub/components/settings_ui/cupertino_settings_section.dart';
import 'package:bell_delivery_hub/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

import 'defines.dart';

// ignore: must_be_immutable
class SettingsSection extends AbstractSection {
  final List<Widget> tiles;
  final TextStyle titleTextStyle;
  final int maxLines;
  final Widget subtitle;
  final EdgeInsetsGeometry subtitlePadding;

  SettingsSection({
    Key key,
    String title,
    EdgeInsetsGeometry titlePadding = defaultTitlePadding,
    this.maxLines,
    this.subtitle,
    this.subtitlePadding = defaultTitlePadding,
    this.tiles,
    this.titleTextStyle,
  })  : assert(titlePadding != null),
        assert(maxLines == null || maxLines > 0),
        super(key: key, title: title, titlePadding: titlePadding);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    // if (platform.isIOS(context)) {
    //   return iosSection();
    // } else {
    return androidSection(context);
    // }
  }

  Widget iosSection() {
    return CupertinoSettingsSection(
      tiles,
      header: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title,
              style: titleTextStyle,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          if (subtitle != null)
            Padding(
              padding: subtitlePadding,
              child: subtitle,
            ),
        ],
      ),
      headerPadding: titlePadding,
    );
  }

  Widget androidSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (title != null)
        Padding(
          padding: titlePadding,
          child: Text(
            title,
            style: titleTextStyle ??
                Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 13.flexibleFontSize,
                      color: context.theme.themeType
                          ? context.theme.textColor
                          : AppColors.greyColor,
                    ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      if (subtitle != null)
        Padding(
          padding: subtitlePadding,
          child: subtitle,
        ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        decoration: BoxDecoration(
          color: context.theme.surface,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tiles.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 1,
            color: context.theme.corePalatte.primaryColor.withOpacity(0.1),
            thickness: 1.0,
            indent: 15,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(10.0), child: tiles[index]);
          },
        ),
      ),
    ]);
  }
}
