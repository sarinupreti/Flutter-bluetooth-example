import 'package:bell_delivery_hub/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

class CustomAlert {
  static void showCustomAlert({
    BuildContext context,
    String message,
    String title,
    bool isSuccess,
  }) {
    showCupertinoModalPopup(
        context: context,
        useRootNavigator: true,
        builder: (BuildContext context) =>
            alertIOS(context, message, title, isSuccess));
  }

  static CupertinoAlertDialog alertIOS(
      BuildContext context, String message, String title, bool isSuccess) {
    return CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            isSuccess
                ? WebsafeSvg.asset("assets/images/check.svg")
                : WebsafeSvg.asset("assets/images/wrong.svg"),
            10.verticalSpace,
            Text(
              title ?? "Error",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ],
        ),
      ),
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            .copyWith(fontWeight: FontWeight.normal),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Close",
            style: AppTextTheme.normal14Text.copyWith(
                fontWeight: FontWeight.normal, color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
