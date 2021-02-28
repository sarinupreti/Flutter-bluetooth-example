import 'package:bell_delivery_hub/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:bell_delivery_hub/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/flash_util.dart';

class InAppViewBottomSheet {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  void showSheet({BuildContext context, String url}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.theme.surface,
      enableDrag: false,
      builder: (context) {
        return SafeArea(
          bottom: true,
          child: SingleChildScrollView(child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Wrap(
                  children: [
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0))),
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0)),
                          color: context.theme.surface,
                        ),
                        child: Wrap(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Payment",
                                    style: AppTextTheme.appBarTitle.copyWith(
                                        color: context.theme.textColor,
                                        fontSize: 18.flexibleFontSize),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: context.theme.themeType
                                                      ? context.theme.surface
                                                      : Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: Icon(
                                                Icons.close,
                                                color: context.theme.themeType
                                                    ? context
                                                        .theme.corePalatte.white
                                                    : Colors.grey[400],
                                                size: 20,
                                              )),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 1.5,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: InAppWebView(
                                initialUrl: url,
                                initialHeaders: {},
                                onWebViewCreated:
                                    (InAppWebViewController controller) {
                                  webView = controller;
                                  print("onWebViewCreated");
                                },
                                onLoadStart: (InAppWebViewController controller,
                                    String url) {
                                  print("onLoadStart $url");
                                  setState(() {
                                    this.url = url;
                                  });
                                },
                                onLoadStop: (InAppWebViewController controller,
                                    String url) async {
                                  setState(() {
                                    this.url = url;
                                  });
                                },
                                onProgressChanged:
                                    (InAppWebViewController controller,
                                        int progress) {
                                  setState(() {
                                    this.progress = progress / 100;
                                  });
                                },
                                onUpdateVisitedHistory:
                                    (InAppWebViewController controller,
                                        String url,
                                        bool androidIsReload) async {
                                  print("onUpdateVisitedHistory $url");
                                  setState(() {
                                    this.url = url;
                                  });

                                  if (url.contains("redirect")) {
                                    // get your token from url

                                    inject<WalletBloc>()
                                        .add(GetWalletBalance());

                                    Navigator.pop(context);

                                    await context.showStatusBar(
                                        duration: Duration(seconds: 5),
                                        icon: Icon(
                                          Icons.check,
                                          color: context
                                              .theme.corePalatte.greenColor,
                                        ),
                                        message: "Payment succesfully..");
                                  }
                                },
                                onConsoleMessage: (controller, consoleMessage) {
                                  print(consoleMessage);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
        );
      },
    );
  }
}
