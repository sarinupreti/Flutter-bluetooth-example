import 'package:cross_connectivity/cross_connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<ConnectivityStatus> get onStatusChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;
  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.checkConnection();

  @override
  Stream<ConnectivityStatus> get onStatusChange =>
      connectionChecker.onConnectivityChanged;
}
