import 'package:bell_delivery_hub/components/custom_alert.dart';
import 'package:bell_delivery_hub/components/qr_scanner/app_barcode_scanner_widget.dart';
import 'package:bell_delivery_hub/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

///
/// FullScreenScannerPage
class QRScannerPage extends StatefulWidget {
  final String barcodeValue;

  const QRScannerPage({Key key, this.barcodeValue}) : super(key: key);

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String _code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Barcode Scanner",
          style: AppTextTheme.appBarTitle.copyWith(
              fontSize: 17.flexibleFontSize, color: context.theme.textColor),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          Expanded(
            child: AppBarcodeScannerWidget.defaultStyle(
              resultCallback: (String code) {
                if (code.trim() == widget.barcodeValue) {
                  Navigator.pop(context);
                  CustomAlert.showCustomAlert(
                      context: context,
                      isSuccess: true,
                      message: "Barcode: $code does match with the product.",
                      title: "Barcode does match");

                  return;
                } else {
                  Navigator.pop(context);

                  CustomAlert.showCustomAlert(
                      context: context,
                      isSuccess: false,
                      message:
                          "Barcode: $code does not match with the product.",
                      title: "Barcode does not match");

                  return;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
