import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

class AppColors {
  const AppColors();

  static const Color primaryColor = const Color(0xFF9657FC);
  static const Color primaryColorAccent = const Color(0xFFEFE6FF);
  static const Color notificationIconColor = const Color(0xFFB7C1D3);
  static const Color notificationbackgroundColor = const Color(0xFFFD655C);
  static const Color notificationSennColor = const Color(0xFF212121);
  static const Color outofStockColor = const Color(0xFFFD655C);
  // #F6F9FF

  static const Color backgroundBlueColor = const Color(0xFFF6F9FF);

  static const Color greyColor = const Color(0xFF9C9C9C);
  static const Color greenColor = const Color(0xFF3CC13C);
  static const Color seaGreenColor = const Color(0xFF15CDA8);

  static const Color outOfStockColor = const Color(0xFFFD655C);

  static const Color pendingColor = const Color(0xFFFDA821);

  static Color splashColor = primaryColor.withOpacity(0.2);
  static Color whiteTransparentColor = white.withOpacity(0.5);

  static const Color white = const Color(0xFFFFFFFF);
  static const Color progressBarColor = const Color(0xFFECEFF4);

  static const Color black = const Color(0xFF000000);
  static const Color gray = const Color(0xFF333333);
  static const Color pink = const Color(0xFFEF4B5F);
  static const Color grayOne = const Color(0xFFEEEEEE);
  static const Color grayTwo = const Color(0xFFDDDDDD);
  static const Color grayThree = const Color(0xFF1E1E1E);
  static Color gray30 = Color.fromRGBO(0, 0, 0, 0.3);
}

// const Color primaryColor = Color(0xFF6990AF);
const Color secondaryColor = Color(0xFF73AFB0);

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildDarkTheme();
ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(color: AppColors.white),
    cardColor: AppColors.white,
    buttonColor: AppColors.primaryColor,
    indicatorColor: AppColors.white,
    toggleableActiveColor: secondaryColor,
    splashColor: AppColors.white,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    backgroundColor: AppColors.white,
    errorColor: const Color(0xFFB00020),
    textTheme: AppTextThemeDark(),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base;
}

ThemeData _buildDarkTheme() {
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: AppColors.primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primaryColor: AppColors.black,
    cardColor: AppColors.black,
    primaryColorDark: AppColors.white,
    primaryColorLight: Colors.black,
    buttonColor: AppColors.primaryColor,
    indicatorColor: AppColors.white,
    toggleableActiveColor: secondaryColor,
    accentColor: secondaryColor,
    canvasColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    backgroundColor: Colors.black,
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base;
}

class AppTextTheme {
  const AppTextTheme();

  static TextStyle textFieldHint =
      TextStyle(fontFamily: "Poppins", fontSize: (14.0).flexibleFontSize);

  static TextStyle welcomeTextTitle = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 24.flexibleFontSize,
      color: AppColors.white);

  static TextStyle selectLanguage = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: (16.0).flexibleFontSize,
      color: AppColors.white);

  static TextStyle bottomNavigationTitles = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
      fontSize: (14.0).flexibleFontSize,
      color: AppColors.primaryColor);

  static TextStyle unbottomNavigationTitles = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
      fontSize: (14.0).flexibleFontSize,
      color: AppColors.gray30);

  static TextStyle nameText = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: (26.0).flexibleFontSize,
      color: AppColors.black);

  static TextStyle title = TextStyle(
      fontFamily: "Poppins",
      fontSize: (18.0).flexibleFontSize,
      color: AppColors.greyColor);

  static TextStyle titleBlack = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: (22.0).flexibleFontSize,
      color: AppColors.black);

  static TextStyle priceTitle = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: (32.0).flexibleFontSize,
      color: AppColors.black);

  static TextStyle appBarTitle = TextStyle(
      fontFamily: "poppins",
      fontSize: 20.flexibleFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black);

  static TextStyle tabBarText = TextStyle(
    fontFamily: "poppins",
    fontSize: 15.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal8Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 10.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal10Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 8.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal12Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 12.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal13Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 13.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal14Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 14.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal15Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 15.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal16Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 16.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal18Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 18.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle normal20Text = TextStyle(
    fontFamily: "poppins",
    fontSize: 20.flexibleFontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle readnoreText = TextStyle(
      fontFamily: "poppins",
      fontWeight: FontWeight.w700,
      fontSize: (16.0).flexibleFontSize,
      color: AppColors.primaryColor);
}

class AppTextThemeDark extends TextTheme {
  const AppTextThemeDark();

  static TextStyle textFieldHint =
      TextStyle(fontFamily: "Poppins", fontSize: (14.0).flexibleFontSize);

  static TextStyle welcomeTextTitle = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 24.flexibleFontSize,
      color: AppColors.white);

  static TextStyle selectLanguage = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: (16.0).flexibleFontSize,
      color: AppColors.white);

  static TextStyle bottomNavigationTitles = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
      fontSize: (14.0).flexibleFontSize,
      color: AppColors.white);

  static TextStyle unbottomNavigationTitles = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
      fontSize: (14.0).flexibleFontSize,
      color: AppColors.gray30);

  static TextStyle nameText = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: (26.0).flexibleFontSize,
      color: AppColors.white);

  static TextStyle title1 = TextStyle(
      fontFamily: "Poppins",
      fontSize: (18.0).flexibleFontSize,
      color: AppColors.greyColor);

  static TextStyle titleBlack = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: (22.0).flexibleFontSize,
      color: AppColors.white);

  static TextStyle priceTitle = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: (32.0).flexibleFontSize,
      color: AppColors.white);

  static TextStyle appBarTitle = TextStyle(
      fontFamily: "poppins",
      fontSize: 18.flexibleFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white);

  static TextStyle tabBarText = TextStyle(
      fontFamily: "poppins",
      fontSize: 15.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal8Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 10.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal10Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 8.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal12Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 12.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal13Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 13.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal14Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 14.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal15Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 15.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal16Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 16.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal18Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 18.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle normal20Text = TextStyle(
      fontFamily: "poppins",
      fontSize: 20.flexibleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white);

  static TextStyle readnoreText = TextStyle(
      fontFamily: "poppins",
      fontWeight: FontWeight.w700,
      fontSize: (16.0).flexibleFontSize,
      color: AppColors.white);
}
