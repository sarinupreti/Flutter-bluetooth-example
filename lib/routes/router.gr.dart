// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../screens/device/device_details.dart';
import '../screens/index/index.dart';

class Routes {
  static const String indexScreen = '/';
  static const String deviceScreen = 'DeviceScreen';
  static const all = <String>{
    indexScreen,
    deviceScreen,
  };
}

class BotsDemomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexScreen, page: IndexScreen),
    RouteDef(Routes.deviceScreen, page: DeviceScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexScreen(),
        settings: data,
      );
    },
    DeviceScreen: (data) {
      final args = data.getArgs<DeviceScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => DeviceScreen(
          key: args.key,
          device: args.device,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension BotsDemomRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushIndexScreen() => push<dynamic>(Routes.indexScreen);

  Future<dynamic> pushDeviceScreen({
    Key key,
    @required BluetoothDevice device,
  }) =>
      push<dynamic>(
        Routes.deviceScreen,
        arguments: DeviceScreenArguments(key: key, device: device),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DeviceScreen arguments holder class
class DeviceScreenArguments {
  final Key key;
  final BluetoothDevice device;
  DeviceScreenArguments({this.key, @required this.device});
}
