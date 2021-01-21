import 'dart:ui';

// import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({
    Key key,
  }) : super(key: key);

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  //

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = '';
  String qr;

  // ScannerController scannerController;

  @override
  void initState() {
    super.initState();
  }

  startCamera() async {
    // await scannerController.scannerViewCreated();
    // await scannerController.startCamera();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                    color: context.theme.corePalatte.blur.withOpacity(0.5),
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
                              borderRadius: BorderRadius.circular((16.0)),
                              color: context.theme.corePalatte.white,
                            ),
                            child: Icon(
                              Icons.close,
                              color: context.theme.corePalatte.greyColor,
                              size: (18.0).flexibleFontSize,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'QR SCANNER',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: context.theme.corePalatte.white,
                                    ),
                          ),
                        ),
                        SizedBox(
                          width: (32.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: (screenHeight * 0.3).flexibleHeight,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Place QR code within the rectangle above.',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.theme.corePalatte.white,
                    ),
              ),
            ),
          ),

          //
        ],
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     print(scanData);
  //     setState(() {
  //       qrText = scanData;
  //     });
  //     controller.pauseCamera();
  //     Navigator.of(context).pop(scanData);
  //   });
  // }

  @override
  void dispose() {
    // controller?.pauseCamera();
    // controller?.dispose();
    super.dispose();
  }
}
