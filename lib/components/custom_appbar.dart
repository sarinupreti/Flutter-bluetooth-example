import 'package:bots_demo/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bots_demo/extensions/context_extension.dart';
import 'package:bots_demo/extensions/number_extensions.dart';

Widget customAppBar(
    {String title,
    String suffixText,
    EdgeInsetsDirectional padding,
    @required bool automaticallyImplyMiddle,
    @required bool automaticallyImplyLeading,
    @required bool dark,
    @required bool centerTitle,
    @required bool isMiddle,
    @required bool leadingIOS,
    Color backgroundColor,
    String previousPageTitle,
    Function onSuffixPressed,
    @required bool suffixIsIcon,
    IconData iconName,
    @required BuildContext context}) {
  return

      // Platform.isIOS
      //     ?

      CupertinoNavigationBar(
          padding: padding ??
              EdgeInsetsDirectional.only(start: 15, top: 0, end: 15, bottom: 0),
          heroTag: "navigation",
          backgroundColor:
              backgroundColor != null ? backgroundColor : AppColors.white,
          border: Border.all(width: 0, color: Colors.transparent),
          actionsForegroundColor: AppColors.greyColor,
          transitionBetweenRoutes: false,
          automaticallyImplyLeading: automaticallyImplyLeading,
          automaticallyImplyMiddle: automaticallyImplyMiddle,
          previousPageTitle: previousPageTitle,
          leading: title != null && title.isNotEmpty && !isMiddle
              ? Text(
                  previousPageTitle != null ? "$previousPageTitle" : "$title",
                  style: AppTextTheme.appBarTitle.copyWith(
                      fontSize: (24).flexibleFontSize,
                      color: context.theme.textColor),
                )
              : leadingIOS
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        CupertinoIcons.backward,
                        color: dark ? AppColors.white : AppColors.greyColor,
                        size: 20.flexibleFontSize,
                      ),
                    )
                  : null,
          middle: isMiddle
              ? Text(
                  "$title",
                  style: AppTextTheme.appBarTitle.copyWith(
                      fontSize: 17.flexibleFontSize,
                      color: context.theme.textColor),
                )
              : null,
          trailing: suffixIsIcon
              ? GestureDetector(
                  onTap: () {
                    onSuffixPressed();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.flexibleHeight),
                      child: Icon(
                        iconName,
                        color: Color(0xFF9C9C9C),
                        size: 20.flexibleFontSize,
                      ),
                    ),
                  ))
              : InkWell(
                  onTap: () {
                    onSuffixPressed();
                  },
                  child: Text("$suffixText",
                      style: AppTextTheme.normal15Text.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 16.flexibleFontSize,
                      ))));
  // : AppBar(
  //     backgroundColor:
  //         backgroundColor != null ? backgroundColor : AppColors.white,
  //     elevation: 0,
  //     centerTitle: centerTitle,
  //     automaticallyImplyLeading: automaticallyImplyLeading,
  //     leading: automaticallyImplyLeading
  //         ? InkWell(
  //             onTap: () {
  //               Navigator.pop(context);
  //             },
  //             child: Icon(
  //               AppIcons.backward,
  //               color: dark ? AppColors.white : AppColors.greyColor,
  //               size: 20.flexibleFontSize,
  //             ))
  //         : null,
  //     title: Text(
  //       "$title",
  //       style: AppTextTheme.appBarTitle.copyWith(
  //         fontSize: centerTitle ? 17.flexibleFontSize : 24.flexibleFontSize,
  //       ),
  //     ),
  //     actions: <Widget>[
  //       suffixIsIcon
  //           ? InkWell(
  //               onTap: () {
  //                 onSuffixPressed();
  //               },
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 16),
  //                 child: Icon(
  //                   iconName,
  //                   color: Color(0xFF9C9C9C),
  //                   size: 20,
  //                 ),
  //               ))
  //           : InkWell(
  //               onTap: () {
  //                 onSuffixPressed();
  //               },
  //               child: Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 16, vertical: 16),
  //                   child: Text(
  //                     "$suffixText",
  //                     style: AppTextTheme.normal15Text.copyWith(
  //                         color: AppColors.primaryColor,
  //                         fontSize: 20.flexibleFontSize),
  //                   )),
  //             )
  //     ],
  //   );
}
