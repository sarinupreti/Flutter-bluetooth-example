import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bots_demo/extensions/context_extension.dart';
import 'package:flutter_offline/flutter_offline.dart';

class ConnectivityScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final Widget appBar;
  final Widget drawer;
  final Widget floatingActionButton;

  final Widget bottomNavigationBar;
  final Widget bottomSheet;
  ConnectivityScaffold(
      {@required this.body,
      @required this.backgroundColor,
      this.appBar,
      this.drawer,
      this.floatingActionButton,
      this.bottomNavigationBar,
      this.bottomSheet});

  @override
  Widget build(BuildContext context) {
    bool connected;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: context.theme.brightness,
        statusBarIconBrightness: context.theme.brightness,
        statusBarColor: Colors.transparent));
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        connected = connectivity != ConnectivityResult.none;
        return Scaffold(
          backgroundColor: this.backgroundColor,
          bottomSheet: this.bottomSheet,
          resizeToAvoidBottomInset: false,
          drawer: drawer,
          floatingActionButton: floatingActionButton,
          appBar: appBar == null
              ? PreferredSize(
                  preferredSize: Size.fromHeight(0.0),
                  child: AppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    brightness: connected ? Brightness.light : Brightness.dark,
                  ),
                )
              : appBar,
          bottomNavigationBar: bottomNavigationBar == null
              ? Container(
                  height: 0,
                )
              : bottomNavigationBar,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    color: connected ? Color(0xFF03fcbe) : Color(0xFFEE4400),
                    height: connected ? 0 : 30,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: connected
                          ? Text(
                              "Connection Restored".toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: context.theme.corePalatte.white),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "No Internet Connection".toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color:
                                              context.theme.corePalatte.white),
                                ),
                                SizedBox(width: 8.0),
                                SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        context.theme.corePalatte.white),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                Expanded(child: body),
              ],
            ),
          ),
        );
      },
      child: SizedBox(),
    );
  }
}
