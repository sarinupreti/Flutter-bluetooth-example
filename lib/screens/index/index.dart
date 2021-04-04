import 'package:auto_route/auto_route.dart';
import 'package:bluetooth_demo/screens/bluetooth_status/bluetooth_off_screen.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:bluetooth_demo/routes/router.gr.dart';

import 'package:flutter/material.dart' hide Router;

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Devices'),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            FlutterBlue.instance.startScan(timeout: Duration(seconds: 10)),
        child: SingleChildScrollView(
          child: StreamBuilder<List<ScanResult>>(
              stream: FlutterBlue.instance.scanResults,
              initialData: [],
              builder: (c, snapshot) {
                print(snapshot);
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.data.length > 0) {
                  return Column(
                    children: snapshot.data.map((r) {
                      return ListTile(
                        onTap: () {
                          return ExtendedNavigator.of(context).push(
                              Routes.deviceScreen,
                              arguments:
                                  DeviceScreenArguments(device: r.device));
                        },
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                        title: Text(
                          r.device.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          r.device.id.toString(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    }).toList(),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator.adaptive();
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                          "Click the button below to search for new devices."),
                    ),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () => FlutterBlue.instance
                    .startScan(timeout: Duration(seconds: 10)));
          }
        },
      ),
    );
  }
}
