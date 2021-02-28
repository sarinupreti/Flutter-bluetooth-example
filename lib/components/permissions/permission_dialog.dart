import 'package:bell_delivery_hub/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

class PermissionDialog extends StatefulWidget {
  //
  //
  final String permissionFor;
  // final BuildContext context;
  // final bool disabled;

  PermissionDialog({
    // @required this.context,
    this.permissionFor,
    // this.disabled = false,
  });

  @override
  _PermissionDialogState createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<PermissionDialog>
    with WidgetsBindingObserver {
  bool appSettingOpened = false;
  BuildContext ctx;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (appSettingOpened && state == AppLifecycleState.resumed) {
      Navigator.of(context).pop(true);
      appSettingOpened = false;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.permissionFor == 'camera'
        ? 'Bots Demo needs permission to access your device camera to take a photos, scan barcode & SKU. Please go to Settings > Privacy > Camera, and enable Bots Demo.'
        : 'Bots Demo needs permission to access your photo library to select images. Please go to Settings > Privacy > Photos, and enable Bots Demo.';

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SimpleDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: (30).flexibleHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Permission Required',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 14.flexibleFontSize,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          message,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AppColors.greyColor,
                              fontSize: 13.flexibleFontSize,
                              height: 1.6,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: (12).flexibleHeight),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                              color: Colors.grey[200],
                              width: 1,
                            ))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          vertical: (20).flexibleWidth),
                                      child: Text(
                                        'Not Now',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color: AppColors.greyColor,
                                                fontSize: (15).flexibleFontSize,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: (34).flexibleWidth,
                                  width: 1,
                                  color: Colors.grey[200],
                                ),
                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                    ),
                                    onTap: () async {
                                      openAppSettings().then((value) {
                                        appSettingOpened = value;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          vertical: (20).flexibleWidth),
                                      child: Text(
                                        'Open Settings',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: (15).flexibleFontSize,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
