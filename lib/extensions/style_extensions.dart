import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension StyleExtension on num {
  // ignore: unnecessary_cast
  double get adaptiveHeight => ScreenUtil().setHeight(this) as double;
  // ignore: unnecessary_cast
  double get adaptiveWidth => ScreenUtil().setWidth(this) as double;
  // ignore: unnecessary_cast
  double get adaptiveFont => ScreenUtil().setSp(this) as double;

  /// Extension for number which will return TextStyle
  TextStyle styleWith({
    Color color,
    FontWeight weight,
    double letterSpacing,
    TextDecoration decoration,
    double height,
  }) =>
      TextStyle(
        fontFamily: 'Montserrat',
        height: height ?? 1.4,
        fontSize: adaptiveFont,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? Colors.black,
        decoration: decoration ?? TextDecoration.none,
        letterSpacing: letterSpacing?.adaptiveWidth ?? 0.0,
      );

  /// Extension for number which will return TextStyle
  TextStyle copyStyleWith({
    Color color,
    FontWeight weight,
    double letterSpacing,
    TextDecoration decoration,
    double height,
  }) =>
      TextStyle(
        fontFamily: 'Montserrat',
        height: height ?? 1.4,
        fontSize: this,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? Colors.black,
        decoration: decoration ?? TextDecoration.none,
        letterSpacing: letterSpacing?.adaptiveWidth ?? 0.0,
      );

  //

  /// Extension for number which will return IconThemeData
  IconThemeData iconStyle({Color color, double opacity}) => IconThemeData(
        size: adaptiveFont,
        color: color ?? Colors.black,
        opacity: opacity ?? 1.0,
      );

  /// Extension for number which will produce horizontal margin using SizedBox
  SizedBox get horizontalSpace => SizedBox(width: adaptiveWidth);

  /// Extension for number which will produce vertical margin using SizedBox
  SizedBox get verticalSpace => SizedBox(height: adaptiveHeight);

  /// Time ago calculation
  String timeAgo({bool short = false}) {
    final duration =
        DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(this));
    final dateTime = DateTime.now().subtract(duration);
    final time = short
        ? timeago.format(dateTime, locale: 'en_short')
        : timeago.format(dateTime);
    return time;
  }

  /// Time stamp formatting
  String formatDateWith(int endDate) {
    if (this != null && endDate != null) {
      //

      final start = DateTime.fromMillisecondsSinceEpoch(this).toLocal();
      final end = DateTime.fromMillisecondsSinceEpoch(endDate).toLocal();

      if (start.month == end.month) {
        if (start.day == end.day) {
          return DateFormat('MMMM d, y').format(start);
        }
        return DateFormat('MMMM d').format(start) +
            DateFormat('-d, y').format(end);
      } else {
        final date = DateFormat('MMMM d - ').format(start) +
            DateFormat('MMMM d, y').format(start);
        return date;
      }
    }
    return '';
  }
}
