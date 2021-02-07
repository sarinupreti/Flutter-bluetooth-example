import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/material.dart';

Function(String result) _resultCallback;

///
/// AppBarcodeScannerWidget
class AppBarcodeScannerWidget extends StatefulWidget {
  ///
  ///
  AppBarcodeScannerWidget.defaultStyle({
    Function(String result) resultCallback,
    String label = 'Barcode Scanner',
  }) {
    _resultCallback = resultCallback ?? (String result) {};
  }

  @override
  _AppBarcodeState createState() => _AppBarcodeState();
}

class _AppBarcodeState extends State<AppBarcodeScannerWidget> {
  @override
  Widget build(BuildContext context) {
    return _BarcodePermissionWidget();
  }
}

class _BarcodePermissionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BarcodePermissionWidgetState();
  }
}

class _BarcodePermissionWidgetState extends State<_BarcodePermissionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: _BarcodeScannerWidget()),
      ],
    );
  }
}

///ScannerWidget
class _BarcodeScannerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppBarcodeScannerWidgetState();
  }
}

class _AppBarcodeScannerWidgetState extends State<_BarcodeScannerWidget> {
  ScannerController _scannerController;

  @override
  void initState() {
    super.initState();

    _scannerController = ScannerController(scannerResult: (result) {
      _resultCallback(result);
    }, scannerViewCreated: () {
      TargetPlatform platform = Theme.of(context).platform;
      if (TargetPlatform.iOS == platform) {
        Future.delayed(Duration(seconds: 2), () {
          _scannerController.startCamera();
          _scannerController.startCameraPreview();
        });
      } else {
        _scannerController.startCamera();
        _scannerController.startCameraPreview();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scannerController.stopCameraPreview();
    _scannerController.stopCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _getScanWidgetByPlatform(),
        )
      ],
    );
  }

  Widget _getScanWidgetByPlatform() {
    return PlatformAiBarcodeScannerWidget(
      platformScannerController: _scannerController,
    );
  }
}
