// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../components/error_screen.dart';
import '../screens/home/home_page.dart';
import '../screens/login_screen.dart';
import '../splash_screen.dart';

class Routes {
  static const String connectStoreScreen = 'ConnectStoreScreen';
  static const String splashScreen = '/';
  static const String errorScreen = 'ErrorScreen';
  static const String homePage = 'HomePage';
  static const all = <String>{
    connectStoreScreen,
    splashScreen,
    errorScreen,
    homePage,
  };
}

class BotsDemomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.connectStoreScreen, page: ConnectStoreScreen),
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.errorScreen, page: ErrorScreen),
    RouteDef(Routes.homePage, page: HomePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    ConnectStoreScreen: (data) {
      final args = data.getArgs<ConnectStoreScreenArguments>(
        orElse: () => ConnectStoreScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ConnectStoreScreen(
          key: args.key,
          context: args.context,
        ),
        settings: data,
      );
    },
    SplashScreen: (data) {
      final args = data.getArgs<SplashScreenArguments>(
        orElse: () => SplashScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(
          key: args.key,
          context: args.context,
        ),
        settings: data,
      );
    },
    ErrorScreen: (data) {
      final args = data.getArgs<ErrorScreenArguments>(
        orElse: () => ErrorScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ErrorScreen(
          key: args.key,
          context: args.context,
          message: args.message,
        ),
        settings: data,
      );
    },
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension BotsDemomRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushConnectStoreScreen({
    Key key,
    BuildContext context,
  }) =>
      push<dynamic>(
        Routes.connectStoreScreen,
        arguments: ConnectStoreScreenArguments(key: key, context: context),
      );

  Future<dynamic> pushSplashScreen({
    Key key,
    BuildContext context,
  }) =>
      push<dynamic>(
        Routes.splashScreen,
        arguments: SplashScreenArguments(key: key, context: context),
      );

  Future<dynamic> pushErrorScreen({
    Key key,
    BuildContext context,
    String message,
  }) =>
      push<dynamic>(
        Routes.errorScreen,
        arguments:
            ErrorScreenArguments(key: key, context: context, message: message),
      );

  Future<dynamic> pushHomePage({
    Key key,
  }) =>
      push<dynamic>(
        Routes.homePage,
        arguments: HomePageArguments(key: key),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ConnectStoreScreen arguments holder class
class ConnectStoreScreenArguments {
  final Key key;
  final BuildContext context;
  ConnectStoreScreenArguments({this.key, this.context});
}

/// SplashScreen arguments holder class
class SplashScreenArguments {
  final Key key;
  final BuildContext context;
  SplashScreenArguments({this.key, this.context});
}

/// ErrorScreen arguments holder class
class ErrorScreenArguments {
  final Key key;
  final BuildContext context;
  final String message;
  ErrorScreenArguments({this.key, this.context, this.message});
}

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  HomePageArguments({this.key});
}
