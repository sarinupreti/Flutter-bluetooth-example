import 'package:bell_delivery_hub/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectStoreErrorModal {
  static void showErrorModal({
    BuildContext context,
    String message,
    bool isCustom,
    String title,
  }) {
    showCupertinoModalPopup(
        context: context,
        useRootNavigator: true,
        builder: (BuildContext context) =>
            alertIOS(context, message, isCustom, title));
  }

  static CupertinoAlertDialog alertIOS(
      BuildContext context, String message, bool isCustom, String title) {
    return CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          isCustom ? title : "Connection error",
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      content: Text(
        message != null && message.isNotEmpty
            ? message == "Sorry, you cannot list resources."
                ? "Invalid consumer key and secret."
                : message
            : "There was a problem connecting with your store. Make sure that you have given read and write permission to your API keys.",
        style: Theme.of(context)
            .textTheme
            .subtitle2
            .copyWith(fontWeight: FontWeight.normal),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            if (isCustom) {
              Navigator.pop(context);
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            "Ok",
            style: AppTextTheme.normal14Text.copyWith(
                fontWeight: FontWeight.normal, color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
