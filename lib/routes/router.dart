import 'package:auto_route/auto_route_annotations.dart';
import 'package:bell_delivery_hub/components/qr_scanner/qr_scanner.dart';
import 'package:bell_delivery_hub/connect_store_screen.dart';
import 'package:bell_delivery_hub/error_screen.dart';
import 'package:bell_delivery_hub/home_page.dart';
import 'package:bell_delivery_hub/order_details.dart';
import 'package:bell_delivery_hub/splash_screen.dart';
import 'package:flutter/material.dart';

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
  MaterialRoute(
    page: QRScannerPage,
    path: "QRScannerPage",
  ),
  MaterialRoute(page: OrderDetailsScreens, path: 'OrderDetailsScreens')
])
class $SwipeCommRouter {}
