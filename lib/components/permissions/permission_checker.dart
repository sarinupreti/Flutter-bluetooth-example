import 'dart:io';
import 'package:bots_demo/components/permissions/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pedantic/pedantic.dart';

/// You have to pass [BuildContext] which is used to display permission dialog.
class PermissionChecker {
  /// [hasLocationPermission] function is used to check location permission.
  ///
  /// [hasCameraPermission] function is used to check camera permission.
  ///
  /// [hasGalleryPermission] function is used to check photos(IOS)/storage(Android) permission.

  static Future<bool> hasLocationPermission(BuildContext context) async {
    //
    /// For android point of view this boolean flag is most important.
    /// Android will keep asking for permission until we check never ask again option.
    /// So to prevent apearing module bottom sheet we have store [isFirstTime] boolean flag
    final isFirstTime = await _isFirstTimeLocationRequest();

    // Current permission status for camera
    var status = await Permission.location.status;

    /// By default permission status is unknown in ios.
    /// So we have to ask permission for IOS from unknown status
    if (status.isUndetermined) {
      await Permission.location.request();
      status = await Permission.location.status;
      return status == PermissionStatus.granted;
    }

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.location.shouldShowRequestRationale;

        /// If this is not first time click and if showing permission aleart box is false
        /// only then display bottom sheet else ask for permission
        if (!isFirstTime && !show) {
          final response = await _openDialog(context, 'location');
          status = response ? await Permission.location.request() : status;
        } else {
          await Permission.location.request();
          status = await Permission.location.status;
        }
      }

      if (Platform.isIOS) {
        final response = await _openDialog(context, 'location');
        status = response ? await Permission.location.request() : status;
      }

      return status == PermissionStatus.granted;
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      final response = await _openDialog(context, 'location');
      status = response ? await Permission.location.request() : status;
      return status == PermissionStatus.granted;
    }

    return status == PermissionStatus.granted;
  }

  /// [hasCameraPermission] function will return true if camera permission is granted
  /// otherwise, return false.
  static Future<bool> hasCameraPermission(BuildContext context) async {
    //

    /// Logic is similar to [hasLocationPermission] function so for more details
    ///  read comments from [hasLocationPermission] function.
    final isFirstTime = await _isFirstTimeCameraRequest();

    // Current permission status for camera
    var status = await Permission.camera.status;

    if (status.isUndetermined) {
      await Permission.camera.request();
      status = await Permission.camera.status;
      return status == PermissionStatus.granted;
    }

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.camera.shouldShowRequestRationale;
        // At start [show] is false => Dont show dialogue
        // After denying show will be true => Dont show dialogue
        // If we check dont ask again show will be false => Show dialogue
        if (!isFirstTime && !show) {
          final response = await _openDialog(context, 'camera');
          status = response ? await Permission.camera.request() : status;
        } else {
          await Permission.camera.request();
          status = await Permission.camera.status;
        }
      }

      if (Platform.isIOS) {
        Navigator.of(context).pop();
        final response = await _openDialog(context, 'camera');
        status = response ? await Permission.camera.request() : status;
      }
      return status == PermissionStatus.granted;
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      final response = await _openDialog(context, 'camera');
      status = response ? await Permission.camera.request() : status;
      return status == PermissionStatus.granted;
    }

    return status == PermissionStatus.granted;
  }

  /// [hasGalleryPermission] function will return true if photos(IOS)/storage(Android)
  /// permission is granted otherwise, return false.
  static Future<bool> hasGalleryPermission(BuildContext context) async {
    //
    /// Check storage permission for android
    if (Platform.isAndroid) {
      /// Logic is similar to [hasLocationPermission] function so for more details
      ///  read comments from [hasLocationPermission] function.
      final isFirstTime = await _isFirstTimeGalleryRequest();

      var status = await Permission.storage.status;

      if (status.isUndetermined) {
        await Permission.storage.request();
        status = await Permission.storage.status;
        return status == PermissionStatus.granted;
      }

      if (status.isDenied) {
        final show = await Permission.storage.shouldShowRequestRationale;
        // At start [show] is false => Dont show dialogue
        // After denying show will be true => Dont show dialogue
        // If we check dont ask again show will be false => Show dialogue
        if (!isFirstTime && !show) {
          // Navigator.of(context).pop();
          final response = await _openDialog(context, 'gallery');
          status = response ? await Permission.storage.request() : status;
        } else {
          await Permission.storage.request();
          status = await Permission.storage.status;
        }
        return status == PermissionStatus.granted;
      }

      if (status.isPermanentlyDenied || status.isRestricted) {
        final response = await _openDialog(context, 'gallery');
        status = response ? await Permission.storage.request() : status;
        return status == PermissionStatus.granted;
      }

      return status == PermissionStatus.granted;
    }

    /// Check photos permission for ios
    if (Platform.isIOS) {
      var status = await Permission.photos.status;

      if (status.isUndetermined) {
        await Permission.photos.request();
        status = await Permission.photos.status;
        return status == PermissionStatus.granted;
      }

      if (status.isDenied ||
          status.isRestricted ||
          status.isPermanentlyDenied) {
        final response = await _openDialog(context, 'gallery');
        status = response ? await Permission.photos.request() : status;
        return status == PermissionStatus.granted;
      }

      return status == PermissionStatus.granted;
    }

    return false;
  }

  //
  //
}

//////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

Future<bool> _openDialog(
  BuildContext context,
  String permissionFor,
) async {
  final response = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) => PermissionDialog(
      permissionFor: permissionFor,
    ),
  );
  return response;
}

/// [_isFirstTimeCameraRequest] function will return true if camera permission is requested for first time otherwise return false
Future<bool> _isFirstTimeCameraRequest() async {
  final firstTimeCameraRequest = 'firstTimeCameraRequest';
  final box = await Hive.openBox(firstTimeCameraRequest);
  if (box.containsKey(firstTimeCameraRequest)) {
    return false;
  } else {
    unawaited(box.put(firstTimeCameraRequest, true));
    return true;
  }
}

/// [_isFirstTimeGalleryRequest] function will return true if gallery permission is
/// requested for first time otherwise return false
Future<bool> _isFirstTimeGalleryRequest() async {
  final firstTimeGalleryRequest = 'firstTimeGalleryRequest';
  final box = await Hive.openBox(firstTimeGalleryRequest);
  if (box.containsKey(firstTimeGalleryRequest)) {
    return false;
  } else {
    unawaited(box.put(firstTimeGalleryRequest, true));
    return true;
  }
}

/// [isFirstTimeLocationRequest] function will return true if location permission is
/// requested for first time otherwise return false
Future<bool> _isFirstTimeLocationRequest() async {
  //
  final firstTimeLocationRequest = 'firstTimeLocationRequest';
  final box = await Hive.openBox(firstTimeLocationRequest);
  if (box.containsKey(firstTimeLocationRequest)) {
    return false;
  } else {
    unawaited(box.put(firstTimeLocationRequest, true));
    return true;
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:eventsmo_app/core/widgets/permission_dialog.dart';
// import 'package:hive/hive.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pedantic/pedantic.dart';

// /// [PermissionChecker] class handle all permission checking stuff in fonepay app
// /// You have to pass [BuildContext] which is used to display bottom sheet.
// class PermissionChecker {
//   //
//   //

//   /// [PermissionChecker] class contain functions which is used to check different
//   /// permissions which is used by Fonepay app.
//   ///
//   /// [hasLocationPermission] function is used to check location permission.
//   ///
//   /// [hasCameraPermission] function is used to check camera permission.
//   ///
//   /// [hasGalleryPermission] function is used to check photos(IOS)/storage(Android) permission.

//   /// [hasLocationPermission] function will return true if location permission is granted
//   /// otherwise, return false. [hasLocationPermission] function has optional parameter [onlyOnce]
//   /// which is of bool type. If [onlyOnce] is true permission will be asked only once for
//   /// aplication active session.

//   static Future<bool> hasLocationPermission(BuildContext context) async {
//     //
//     /// For android point of view this boolean flag is most important.
//     /// Android will keep asking for permission until we check never ask again option.
//     /// So to prevent apearing module bottom sheet we have store [isFirstTime] boolean flag
//     /// in shared preference. At first isFirstTime will be false, as soon as user click specific
//     /// button isFirstTime flag is set to true. After that isFirstTime value will be true untill user
//     /// uninstall app.
//     final isFirstTime = await _isFirstTimeLocationRequest();

//     // Current permission status for camera
//     var status = await Permission.location.status;

//     /// By default permission status is unknown in ios.
//     /// So we have to ask permission for IOS from unknown status
//     if (status.isUndetermined) {
//       await Permission.location.request();
//       status = await Permission.location.status;
//     }

//     if (status.isDenied) {
//       if (Platform.isAndroid) {
//         final show = await Permission.location.shouldShowRequestRationale;

//         /// If this is not first time click and if showing permission aleart box is false
//         /// only then display bottom sheet else ask for permission
//         if (!isFirstTime && !show) {
//           final response = openDialog();
//           // PermissionDialog(
//           //   permissionFor: 'location',
//           //   context: context,
//           // );
//         } else {
//           await await Permission.location.request();
//           status = await Permission.location.status;
//         }
//       } else if (Platform.isIOS) {
//         PermissionDialog(
//           permissionFor: 'location',
//           context: context,
//         );
//       }
//     }

//     if (status.isPermanentlyDenied || status.isRestricted) {
//       PermissionDialog(
//         permissionFor: 'location',
//         context: context,
//         // disabled: status.isPermanentlyDenied && Platform.isAndroid,
//         // ? Platform.isAndroid
//         //     ? true
//         //     : false
//         // : false,
//       );
//     }

//     return status == PermissionStatus.granted;
//   }

//   /// [hasCameraPermission] function will return true if camera permission is granted
//   /// otherwise, return false.
//   static Future<bool> hasCameraPermission(BuildContext context) async {
//     //

//     /// Logic is similar to [hasLocationPermission] function so for more details
//     ///  read comments from [hasLocationPermission] function.
//     final isFirstTime = await _isFirstTimeCameraRequest();

//     // Current permission status for camera
//     var status = await Permission.camera.status;

//     if (status.isUndetermined) {
//       await Permission.camera.request();
//       status = await Permission.camera.status;
//     }

//     if (status.isDenied) {
//       if (Platform.isAndroid) {
//         final show = await Permission.camera.shouldShowRequestRationale;

//         // At start [show] is false => Dont show dialogue
//         // After denying show will be true => Dont show dialogue
//         // If we check dont ask again show will be false => Show dialogue
//         if (!isFirstTime && !show) {
//           PermissionDialog(
//             permissionFor: 'camera',
//             context: context,
//           );
//         } else {
//           await Permission.camera.request();
//           status = await Permission.camera.status;
//         }
//       } else if (Platform.isIOS) {
//         Navigator.of(context).pop();
//         PermissionDialog(
//           permissionFor: 'camera',
//           context: context,
//         );
//       }
//     }

//     if (status.isPermanentlyDenied || status.isRestricted) {
//       // For android no need to pop..
//       // Navigator.of(context).pop();
//       PermissionDialog(
//         permissionFor: 'camera',
//         context: context,
//       );
//     }

//     return status == PermissionStatus.granted;
//   }

//   static Future<bool> openDialog(
//       BuildContext context, String permissionFor) async {
//     final response = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) => PermissionDialog(
//         permissionFor: permissionFor,
//       ),
//     );
//     return response;
//   }

//   /// [hasGalleryPermission] function will return true if photos(IOS)/storage(Android)
//   /// permission is granted otherwise, return false.
//   static Future<bool> hasGalleryPermission(BuildContext context) async {
//     //
//     /// Check storage permission for android
//     if (Platform.isAndroid) {
//       //
//       /// Logic is similar to [hasLocationPermission] function so for more details
//       ///  read comments from [hasLocationPermission] function.
//       final isFirstTime = await _isFirstTimeGalleryRequest();

//       var status = await Permission.storage.status;

//       if (status.isUndetermined) {
//         await Permission.storage.request();
//         status = await Permission.storage.status;
//       }

//       if (status.isDenied) {
//         //

//         final show = await Permission.storage.shouldShowRequestRationale;

//         // At start [show] is false => Dont show dialogue
//         // After denying show will be true => Dont show dialogue
//         // If we check dont ask again show will be false => Show dialogue
//         if (!isFirstTime && !show) {
//           Navigator.of(context).pop();
//           PermissionDialog(
//             permissionFor: 'storage',
//             context: context,
//           );
//         } else {
//           await Permission.storage.request();
//           status = await Permission.storage.status;
//         }
//       }

//       if (status.isPermanentlyDenied || status.isRestricted) {
//         Navigator.of(context).pop();
//         PermissionDialog(
//           permissionFor: 'storage',
//           context: context,
//         );
//       }

//       return status == PermissionStatus.granted;
//     }

//     /// Check photos permission for ios
//     if (Platform.isIOS) {
//       //
//       //
//       var status = await Permission.photos.status;

//       if (status.isUndetermined) {
//         await Permission.photos.request();
//         status = await Permission.photos.status;
//       }

//       if (status.isDenied ||
//           status.isRestricted ||
//           status.isPermanentlyDenied) {
//         Navigator.of(context).pop();
//         PermissionDialog(
//           permissionFor: 'photos',
//           context: context,
//         );
//       }

//       return status == PermissionStatus.granted ? true : false;
//     }

//     return false;
//   }

//   //
//   //
// }

// //////////////////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////////////////////

// /// [_isFirstTimeCameraRequest] function will return true if camera permission is requested for first time otherwise return false
// Future<bool> _isFirstTimeCameraRequest() async {
//   final firstTimeCameraRequest = 'firstTimeCameraRequest';
//   final box = await Hive.openBox(firstTimeCameraRequest);
//   if (box.containsKey(firstTimeCameraRequest)) {
//     return false;
//   } else {
//     unawaited(box.put(firstTimeCameraRequest, true));
//     return true;
//   }
// }

// /// [_isFirstTimeGalleryRequest] function will return true if gallery permission is
// /// requested for first time otherwise return false
// Future<bool> _isFirstTimeGalleryRequest() async {
//   final firstTimeGalleryRequest = 'firstTimeGalleryRequest';
//   final box = await Hive.openBox(firstTimeGalleryRequest);
//   if (box.containsKey(firstTimeGalleryRequest)) {
//     return false;
//   } else {
//     unawaited(box.put(firstTimeGalleryRequest, true));
//     return true;
//   }
// }

// /// [isFirstTimeLocationRequest] function will return true if location permission is
// /// requested for first time otherwise return false
// Future<bool> _isFirstTimeLocationRequest() async {
//   //
//   final firstTimeLocationRequest = 'firstTimeLocationRequest';
//   final box = await Hive.openBox(firstTimeLocationRequest);
//   if (box.containsKey(firstTimeLocationRequest)) {
//     return false;
//   } else {
//     unawaited(box.put(firstTimeLocationRequest, true));
//     return true;
//   }
// }
