import 'package:bots_demo/theme/themes/theme_palatte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeCubit extends Cubit<ThemePalatte> {
  ThemeCubit() : super(ThemePalatte.lightThemePalatte);
  Future fetchTheme() async {
    var themebox = await Hive.openBox('themeBox');
    var theme = await themebox.get('theme');

    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    final themePallet = theme == null
        ? darkModeOn
            ? ThemePalatte.darkThemePalatte
            : ThemePalatte.lightThemePalatte
        : theme == false
            ? ThemePalatte.lightThemePalatte
            : ThemePalatte.darkThemePalatte;
    return emit(themePallet ?? false);
  }

  void switchTheme(bool themeType) async {
    final themePallet = themeType == null
        ? ThemePalatte.lightThemePalatte
        : themeType == false
            ? ThemePalatte.lightThemePalatte
            : ThemePalatte.darkThemePalatte;
    var themebox = await Hive.openBox('themeBox');
    await themebox.put("theme", themeType);
    return emit(themePallet);
  }
}
