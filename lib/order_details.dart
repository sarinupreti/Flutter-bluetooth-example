import 'package:bell_delivery_hub/components/settings_ui/settings_section.dart';
import 'package:bell_delivery_hub/modal/order/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

class OrderDetailsScreens extends StatefulWidget {
  final String orderId;
  final Order data;

  const OrderDetailsScreens({Key key, this.orderId, this.data})
      : super(key: key);

  @override
  _OrderDetailsScreensState createState() => _OrderDetailsScreensState();
}

class _OrderDetailsScreensState extends State<OrderDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Hero(tag: "icon", child: Text(widget.orderId)),
      ),
      body: Column(
        children: <Widget>[
          SettingsSection(
            titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            title: 'Active Site'.toUpperCase(),
            tiles: [
              // activeSiteWidget(context),
            ],
          ),
        ],
      ),
    );
  }
}
