import 'package:auto_route/auto_route_annotations.dart';
import 'package:bell_delivery_hub/components/qr_scanner.dart';
import 'package:bell_delivery_hub/connect_store_screen.dart';
import 'package:bell_delivery_hub/home_page.dart';

@MaterialRouter(generateNavigationHelperExtension: true, routes: <AutoRoute>[
  MaterialRoute(
    page: ConnectStoreScreen,
    initial: true,
  ),
  MaterialRoute(
    page: HomePage,
    path: "HomePage",
  ),
  MaterialRoute(page: QRScannerPage, path: 'QRScannerPage')
])
class $SwipeCommRouter {}
