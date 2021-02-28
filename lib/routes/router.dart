import 'package:auto_route/auto_route_annotations.dart';
import 'package:bell_delivery_hub/screens/login_screen.dart';
import 'package:bell_delivery_hub/components/error_screen.dart';
import 'package:bell_delivery_hub/screens/home/home_page.dart';
import 'package:bell_delivery_hub/splash_screen.dart';

@MaterialRouter(generateNavigationHelperExtension: true, routes: <AutoRoute>[
  MaterialRoute(
    page: ConnectStoreScreen,
    path: "ConnectStoreScreen",
  ),
  MaterialRoute(
    page: SplashScreen,
    initial: true,
  ),
  MaterialRoute(
    page: ErrorScreen,
    path: "ErrorScreen",
  ),
  MaterialRoute(
    page: HomePage,
    path: "HomePage",
  ),
  // MaterialRoute(
  //   page: QRScannerPage,
  //   path: "QRScannerPage",
  // ),
])
class $BotsDemomRouter {}
