import 'package:auto_route/auto_route_annotations.dart';
import 'package:bots_demo/screens/login_screen.dart';
import 'package:bots_demo/components/error_screen.dart';
import 'package:bots_demo/screens/home/home_page.dart';
import 'package:bots_demo/splash_screen.dart';

@MaterialRouter(generateNavigationHelperExtension: true, routes: <AutoRoute>[
  MaterialRoute(
    page: LoginScreen,
    path: "LoginScreen",
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
