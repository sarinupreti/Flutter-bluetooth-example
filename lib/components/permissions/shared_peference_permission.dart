import 'package:shared_preferences/shared_preferences.dart';

class FonePaySharedPreferences {
  //
  //
  /// [isFirstTimeCameraRequest] function will return true if camera permission is
  /// requested for first time otherwise return false
  static Future<bool> isFirstTimeCameraRequest() async {
    //
    final String firstTimeCameraRequest = 'firstTimeCameraRequest';

    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey(firstTimeCameraRequest)) {
      return false;
    } else {
      pref.setBool(firstTimeCameraRequest, false);
      return true;
    }
  }

  /// [isFirstTimeGalleryRequest] function will return true if gallery permission is
  /// requested for first time otherwise return false
  static Future<bool> isFirstTimeGalleryRequest() async {
    //
    final String firstTimeGalleryRequest = 'firstTimeGalleryRequest';

    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey(firstTimeGalleryRequest)) {
      return false;
    } else {
      pref.setBool(firstTimeGalleryRequest, false);
      return true;
    }
  }

  /// [isFirstTimeLocationRequest] function will return true if location permission is
  /// requested for first time otherwise return false
  static Future<bool> isFirstTimeLocationRequest() async {
    //
    final String firstTimeLocationRequest = 'firstTimeLocationRequest';

    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey(firstTimeLocationRequest)) {
      return false;
    } else {
      pref.setBool(firstTimeLocationRequest, false);
      return true;
    }
  }
}
