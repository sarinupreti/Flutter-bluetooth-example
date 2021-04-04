import 'package:bluetooth_demo/theme/themes/theme_cubit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.instance;

Future<void> initDependencyInjection() async {
  // register http client and configure network
  _registerNetworkAndLocalDatabase();
  _registerBlocs();
  _registerRepository();
}

void _registerNetworkAndLocalDatabase() {
  inject.registerLazySingleton(() => Connectivity());
}

void _registerBlocs() {
  inject.registerLazySingleton(() => ThemeCubit());
}

void _registerRepository() {}
