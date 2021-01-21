// import 'package:auto_route/auto_route.dart';

// extension NavigatorStateExtension on ExtendedNavigatorState {
//   void pushNamedIfNotCurrent(String routeName, {Object arguments}) {
//     if (!isCurrent(routeName)) {
//       if (ExtendedNavigator.root != null)
//         ExtendedNavigator.root.push(routeName, arguments: arguments);
//     }
//   }

//   void pushAndRemoveUntilIfNotCurrent(String routeName, {Object arguments}) {
//     if (!isCurrent(routeName)) {
//       if (ExtendedNavigator.root != null)
//         ExtendedNavigator.root.pushAndRemoveUntil(routeName, (route) => false,
//             arguments: arguments);
//     }
//   }

//   bool isCurrent(String routeName) {
//     bool isCurrent = false;
//     if (ExtendedNavigator.root != null)
//       ExtendedNavigator.root.popUntil((route) {
//         if (route.settings.name == routeName) {
//           isCurrent = true;
//         }
//         return true;
//       });
//     return isCurrent;
//   }
// }
