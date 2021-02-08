import 'dart:convert';
import 'dart:ui';

import 'package:bell_delivery_hub/components/custom_alert.dart';
import 'package:bell_delivery_hub/modal/qr_scanned_response.dart';
import 'package:bell_delivery_hub/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserQRScannerPage extends StatefulWidget {
  final String barcodeValue;

  const UserQRScannerPage({Key key, this.barcodeValue}) : super(key: key);

  @override
  _UserQRScannerPageState createState() => _UserQRScannerPageState();
}

class _UserQRScannerPageState extends State<UserQRScannerPage> {
  //

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = '';
  String qr;
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            //
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: context.theme.corePalatte.primaryColor,
                borderRadius: (10.0).flexibleWidth,
                borderLength: (100.0).flexibleWidth,
                borderWidth: (10.0).flexibleWidth,
                cutOutSize:
                    MediaQuery.of(context).size.width - (100.0).flexibleWidth,
              ),
            ),

            //
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: (20.0).flexibleWidth,
                        right: (20.0).flexibleWidth,
                        bottom: (30.0).flexibleHeight,
                        top: MediaQuery.of(context).padding.top +
                            (30.0).flexibleHeight,
                      ),
                      color: Color(0xFF647B8C).withOpacity(0.2),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: (32.0),
                              width: (32.0),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: Icon(
                                Icons.close,
                                color: context.theme.corePalatte.greyColor,
                                size: (18.0).flexibleFontSize,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'BARCODE SCANNER',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFFFFFFF),
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 32.0.flexibleWidth,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: (MediaQuery.of(context).size.height * 0.2),
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Place QR code/Barcode within the rectangle above.',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanCode) async {
      final code = scanCode.code;

      if (code.trim() == widget.barcodeValue) {
        controller.pauseCamera();
        SharedPreferences pref = await SharedPreferences.getInstance();

        final data = QRScannedResponse(code, true);

        if (!pref.containsKey(code)) {
          setState(() {
            pref.setStringList(widget.barcodeValue, [json.encode(data)]);
          });
        }

        Navigator.pop(context, pref);

        return CustomAlert.showCustomAlert(
            context: context,
            isSuccess: true,
            message: "Barcode: $code does match with the product.",
            title: "Barcode does match");

        // return;
      } else {
        controller.pauseCamera();
        SharedPreferences pref = await SharedPreferences.getInstance();

        final data = QRScannedResponse(widget.barcodeValue, false);

        setState(() {
          pref.setStringList(widget.barcodeValue, [json.encode(data)]);
        });
        Navigator.pop(context, pref);

        CustomAlert.showCustomAlert(
            context: context,
            isSuccess: false,
            message: "Barcode: $code does not match with the product.",
            title: "Barcode does not match");

        return;
      }
    });
  }

  @override
  void dispose() {
    // controller?.pauseCamera();
    controller?.dispose();
    super.dispose();
  }
}
