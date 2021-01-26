import 'package:bell_delivery_hub/components/settings_ui/cupertino_settings_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

enum _SettingsTileType { simple, switchTile }

class SettingsTile extends StatelessWidget {
  final String title;
  final int titleMaxLines;
  final String subtitle;
  final int subtitleMaxLines;
  final IconData leading;
  final Widget trailing;
  final Function(BuildContext context) onPressed;
  final Function(bool value) onToggle;
  final bool switchValue;
  final bool enabled;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final Color switchActiveColor;
  final Color iconbackgroundColor;
  final _SettingsTileType _tileType;
  final double contentPadding;

  const SettingsTile({
    Key key,
    @required this.title,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.trailing,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.enabled = true,
    this.onPressed,
    this.iconbackgroundColor,
    this.switchActiveColor,
    this.contentPadding,
  })  : _tileType = _SettingsTileType.simple,
        onToggle = null,
        switchValue = null,
        assert(titleMaxLines == null || titleMaxLines > 0),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0),
        super(key: key);

  const SettingsTile.switchTile({
    Key key,
    @required this.title,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.enabled = true,
    this.trailing,
    this.iconbackgroundColor,
    @required this.onToggle,
    @required this.switchValue,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.switchActiveColor,
    this.contentPadding,
  })  : _tileType = _SettingsTileType.switchTile,
        onPressed = null,
        assert(titleMaxLines == null || titleMaxLines > 0),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    // if (platform.isIOS(context)) {
    //   return iosTile(context);
    // } else {
    return androidTile(context);
    // }
  }

  Widget iosTile(BuildContext context) {
    if (_tileType == _SettingsTileType.switchTile) {
      return CupertinoSettingsItem(
        enabled: enabled,
        type: SettingsItemType.toggle,
        label: title,
        labelMaxLines: titleMaxLines,
        leading: leading != null && iconbackgroundColor != null
            ? ClipRRect(
                // borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 45.flexibleHeight,
                  width: 45.flexibleHeight,
                  color: iconbackgroundColor != null
                      ? iconbackgroundColor.withOpacity(0.25)
                      : context.theme.corePalatte.primaryColor
                          .withOpacity(0.25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Icon(
                        leading,
                        color: iconbackgroundColor,
                        size: 18.flexibleFontSize,
                      ),
                    ),
                  ),
                ),
              )
            : null,
        switchValue: switchValue,
        onToggle: onToggle,
        labelTextStyle: titleTextStyle ??
            Theme.of(context).textTheme.subtitle1.copyWith(
                color: !enabled
                    ? context.theme.themeType
                        ? context.theme.textColor
                        : context.theme.corePalatte.greyColor
                    : context.theme.textColor,
                fontSize: 15.flexibleFontSize),
        switchActiveColor: switchActiveColor,
        subtitleTextStyle: subtitleTextStyle ??
            Theme.of(context).textTheme.subtitle1.copyWith(
                color: context.theme.themeType
                    ? context.theme.textColor
                    : context.theme.corePalatte.greyColor,
                fontSize: 13.flexibleFontSize),
        valueTextStyle: subtitleTextStyle ??
            Theme.of(context).textTheme.subtitle1.copyWith(
                color: context.theme.themeType
                    ? context.theme.textColor
                    : context.theme.corePalatte.greyColor,
                fontSize: 13.flexibleFontSize),
      );
    } else {
      return CupertinoSettingsItem(
        enabled: enabled,
        type: SettingsItemType.modal,
        label: title,
        labelMaxLines: titleMaxLines,
        value: subtitle,
        subtitleMaxLines: subtitleMaxLines,
        trailing: trailing,
        hasDetails: false,
        leading: leading != null && iconbackgroundColor != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 45.flexibleHeight,
                  width: 45.flexibleHeight,
                  color: iconbackgroundColor != null
                      ? iconbackgroundColor.withOpacity(0.25)
                      : context.theme.corePalatte.primaryColor
                          .withOpacity(0.25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Icon(
                        leading,
                        color: iconbackgroundColor,
                        size: 18.flexibleFontSize,
                      ),
                    ),
                  ),
                ),
              )
            : null,
        onPress: onTapFunction(context),
        labelTextStyle: titleTextStyle ??
            Theme.of(context).textTheme.subtitle1.copyWith(
                color: !enabled
                    ? context.theme.themeType
                        ? context.theme.textColor
                        : context.theme.corePalatte.greyColor
                    : context.theme.textColor,
                fontSize: 15.flexibleFontSize),
        subtitleTextStyle: subtitleTextStyle ??
            Theme.of(context).textTheme.subtitle1.copyWith(
                color: context.theme.themeType
                    ? context.theme.textColor
                    : context.theme.corePalatte.greyColor,
                fontSize: 13.flexibleFontSize),
        valueTextStyle: subtitleTextStyle ??
            Theme.of(context).textTheme.subtitle1.copyWith(
                color: context.theme.themeType
                    ? context.theme.textColor
                    : context.theme.corePalatte.greyColor,
                fontSize: 13.flexibleFontSize),
      );
    }
  }

  Widget androidTile(BuildContext context) {
    if (_tileType == _SettingsTileType.switchTile) {
      return Material(
        color: context.theme.surface,
        child: SwitchListTile(
          contentPadding: EdgeInsets.symmetric(
              vertical: contentPadding ?? 10, horizontal: 20),
          secondary: leading != null && iconbackgroundColor != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 45.flexibleHeight,
                    width: 45.flexibleHeight,
                    color: iconbackgroundColor != null
                        ? iconbackgroundColor.withOpacity(0.25)
                        : context.theme.corePalatte.primaryColor
                            .withOpacity(0.25),
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Icon(
                          leading,
                          color: iconbackgroundColor,
                          size: 18.flexibleFontSize,
                        ),
                      ),
                    ),
                  ))
              : null,
          value: switchValue,
          activeColor: switchActiveColor,
          onChanged: enabled ? onToggle : null,
          title: Text(
            title,
            style: titleTextStyle ??
                Theme.of(context).textTheme.subtitle1.copyWith(
                    color: !enabled
                        ? context.theme.themeType
                            ? context.theme.textColor
                            : context.theme.corePalatte.greyColor
                        : context.theme.textColor,
                    fontSize: 15.flexibleFontSize),
            maxLines: titleMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: subtitleTextStyle ??
                      Theme.of(context).textTheme.subtitle1.copyWith(
                          color: context.theme.themeType
                              ? context.theme.textColor
                              : context.theme.corePalatte.greyColor,
                          fontSize: 13.flexibleFontSize),
                  maxLines: subtitleMaxLines,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
        ),
      );
    } else {
      return Material(
        color: context.theme.surface,
        child: InkWell(
          onTap: onTapFunction(context),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
                vertical: contentPadding ?? 10, horizontal: 20),
            title: Text(
              title,
              style: titleTextStyle ??
                  Theme.of(context).textTheme.subtitle1.copyWith(
                      color: !enabled
                          ? context.theme.themeType
                              ? context.theme.textColor
                              : context.theme.corePalatte.greyColor
                          : context.theme.textColor,
                      fontSize: 15.flexibleFontSize),
            ),
            subtitle: subtitle != null
                ? Text(
                    subtitle,
                    style: subtitleTextStyle ??
                        Theme.of(context).textTheme.subtitle1.copyWith(
                            color: context.theme.themeType
                                ? context.theme.textColor
                                : context.theme.corePalatte.greyColor,
                            fontSize: 13.flexibleFontSize),
                    maxLines: subtitleMaxLines,
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
            leading: leading != null && iconbackgroundColor != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 45.flexibleHeight,
                      width: 45.flexibleHeight,
                      color: iconbackgroundColor != null
                          ? iconbackgroundColor.withOpacity(0.25)
                          : context.theme.corePalatte.primaryColor
                              .withOpacity(0.25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Icon(
                            leading,
                            color: iconbackgroundColor,
                            size: 20.flexibleFontSize,
                          ),
                        ),
                      ),
                    ))
                : null,
            enabled: enabled,
            trailing: trailing,
            onTap: onTapFunction(context),
          ),
        ),
      );
    }
  }

  Function onTapFunction(BuildContext context) {
    Function onTapFunction;
    if (onPressed != null) {
      onTapFunction = () {
        onPressed.call(context);
      };
    }
    return onTapFunction;
  }
}
