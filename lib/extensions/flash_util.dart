import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

extension CaliberBuildContextExtension on BuildContext {
  static TextStyle _contentStyle(BuildContext context, [Color color]) {
    var theme = Theme.of(context);
    return (theme.dialogTheme?.contentTextStyle ?? theme.textTheme.bodyText1)
        .copyWith(color: color);
  }

  void showBottomFlash({
    bool persistent = true,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    showFlash(
      context: this,
      persistent: persistent,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: margin,
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.blue,
          boxShadows: kElevationToShadow[8],
          backgroundGradient: RadialGradient(
            colors: [Colors.amber, Colors.black87],
            center: Alignment.topLeft,
            radius: 2,
          ),
          onTap: () => controller.dismiss(),
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.bounceIn,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: FlashBar(
              title: Text('Hello Flash'),
              message: Text('You can put any message of any length here.'),
              leftBarIndicatorColor: Colors.red,
              icon: Icon(Icons.info_outline),
              primaryAction: FlatButton(
                onPressed: () => controller.dismiss(),
                child: Text('DISMISS'),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => controller.dismiss('Yes, I do!'),
                    child: Text('YES')),
                FlatButton(
                    onPressed: () => controller.dismiss('No, I do not!'),
                    child: Text('NO')),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      if (_ != null) {
        showMessage(_.toString());
      }
    });
  }

  void showMessage(
    String message,
  ) {
    showFlash(
        context: this,
        duration: Duration(seconds: 3),
        builder: (_, controller) {
          return Flash(
            controller: controller,
            backgroundColor: Colors.white,
            position: FlashPosition.top,
            style: FlashStyle.floating,
            child: FlashBar(
              message: Text(message,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14.flexibleFontSize,
                      color: Colors.red,
                      fontWeight: FontWeight.w500)),
            ),
          );
        });
  }

  showStatusBar({
    @required String message,
    @required Icon icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    return showFlash(
      context: this,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          borderRadius: BorderRadius.circular(5.0),
          boxShadows: kElevationToShadow[1],
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          controller: controller,
          position: FlashPosition.bottom,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          backgroundColor: Colors.white,
          child: FlashBar(
            padding: EdgeInsets.all(20.0),
            message: Text(message, style: _contentStyle(context, Colors.black)),
            icon: icon,
            leftBarIndicatorColor: Colors.white,
          ),
        );
      },
    );
  }
}
