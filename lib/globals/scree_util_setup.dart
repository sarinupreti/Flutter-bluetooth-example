import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilSetup extends StatelessWidget {
  final Widget child;
  const ScreenUtilSetup({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: Builder(
        builder: (BuildContext context) {
          ScreenUtil.init(
            context,
            designSize: Size(375, 812),
            allowFontScaling: true,
          );
          return child;
        },
      ),
    );
  }
}
