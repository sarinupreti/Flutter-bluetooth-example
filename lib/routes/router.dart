import 'package:auto_route/auto_route_annotations.dart';
import 'package:bots_demo/screens/device_details.dart';
import 'package:bots_demo/screens/index/index.dart';

@MaterialRouter(generateNavigationHelperExtension: true, routes: <AutoRoute>[
  MaterialRoute(
    page: IndexScreen,
    initial: true,
  ),
  MaterialRoute(
    page: DeviceScreen,
    path: "DeviceScreen",
  ),
])
class $BotsDemomRouter {}
