// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../components/qr_scanner.dart';
import '../connect_store_screen.dart';
import '../home_page.dart';
import '../modal/website_data.dart';

class Routes {
  static const String connectStoreScreen = '/';
  static const String homePage = 'HomePage';
  static const String qRScannerPage = 'QRScannerPage';
  static const all = <String>{
    connectStoreScreen,
    homePage,
    qRScannerPage,
  };
}

class SwipeCommRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.connectStoreScreen, page: ConnectStoreScreen),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.qRScannerPage, page: QRScannerPage),
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
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(
          key: args.key,
          websiteData: args.websiteData,
        ),
        settings: data,
      );
    },
    QRScannerPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const QRScannerPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension SwipeCommRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushConnectStoreScreen({
    Key key,
    BuildContext context,
  }) =>
      push<dynamic>(
        Routes.connectStoreScreen,
        arguments: ConnectStoreScreenArguments(key: key, context: context),
      );

  Future<dynamic> pushHomePage({
    Key key,
    WebsiteData websiteData,
  }) =>
      push<dynamic>(
        Routes.homePage,
        arguments: HomePageArguments(key: key, websiteData: websiteData),
      );

  Future<dynamic> pushQRScannerPage() => push<dynamic>(Routes.qRScannerPage);
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

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final WebsiteData websiteData;
  HomePageArguments({this.key, this.websiteData});
}
