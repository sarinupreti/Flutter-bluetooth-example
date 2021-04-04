import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:bluetooth_demo/extensions/number_extensions.dart';
import 'package:bluetooth_demo/extensions/context_extension.dart';

class DeviceScreen extends StatelessWidget {
  final BluetoothDevice device;

  const DeviceScreen({Key key, @required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        elevation: 0,
        backgroundColor: context.theme.surface,
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: context.theme.textColor),
        // actions: <Widget>[
        //   StreamBuilder<BluetoothDeviceState>(
        //     stream: device.state,
        //     initialData: BluetoothDeviceState.connecting,
        //     builder: (c, snapshot) {
        //       VoidCallback onPressed;
        //       String text;
        //       switch (snapshot.data) {
        //         case BluetoothDeviceState.connected:
        //           onPressed = () => device.disconnect();
        //           text = 'DISCONNECT';
        //           break;
        //         case BluetoothDeviceState.disconnected:
        //           onPressed = () => device.connect();
        //           text = 'CONNECT';
        //           break;
        //         default:
        //           onPressed = null;
        //           text = snapshot.data.toString().substring(21).toUpperCase();
        //           break;
        //       }
        //       return TextButton(
        //           onPressed: onPressed,
        //           child: Text(
        //             text,
        //             style: Theme.of(context)
        //                 .textTheme
        //                 .button
        //                 ?.copyWith(color: context.theme.textColor),
        //           ));
        //     },
        //   )
        // ],
      ),
      body: Container(
        color: context.theme.background,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StreamBuilder<BluetoothDeviceState>(
                stream: device.state,
                initialData: BluetoothDeviceState.connecting,
                builder: (c, snapshot) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                      'Device is ${snapshot.data.toString().split('.')[1]}.'),
                  subtitle: Text('${device.id}'),
                ),
              ),
              30.verticalSpace,
              Text("Device Details",
                  style: Theme.of(context).textTheme.subtitle1),
              10.verticalSpace,
              Text("NAME : ${device.name}",
                  style: Theme.of(context).textTheme.bodyText1),
              10.verticalSpace,
              Text("ID : ${device.id}",
                  style: Theme.of(context).textTheme.bodyText1),
              10.verticalSpace,
              Text("TYPE : ${device.type}",
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ),
      ),
    );
  }
}
