import 'package:bell_delivery_hub/components/settings_ui/abstract_section.dart';
import 'package:bell_delivery_hub/utils/theme.dart';
import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final List<Widget> sections;
  final Color backgroundColor;
  final Color lightBackgroundColor;
  final Color darkBackgroundColor;

  const SettingsList({
    Key key,
    this.sections,
    this.backgroundColor,
    this.physics,
    this.shrinkWrap = false,
    this.lightBackgroundColor,
    this.darkBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: Theme.of(context).brightness == Brightness.light
            ? backgroundColor ?? lightBackgroundColor ?? AppColors.greyColor
            : backgroundColor ?? darkBackgroundColor ?? Colors.black,
        child: ListView.builder(
          physics: physics,
          shrinkWrap: shrinkWrap,
          itemCount: sections.length,
          itemBuilder: (context, index) {
            AbstractSection current = sections[index];
            AbstractSection futureOne;
            if (index + 1 != sections.length) {
              futureOne = sections[index + 1];
            }

            // Add divider if title is null
            if (futureOne != null && futureOne.title != null) {
              current.showBottomDivider = false;
              return current;
            } else {
              current.showBottomDivider = true;
              return current;
            }
          },
        ),
      ),
    );
  }
}
