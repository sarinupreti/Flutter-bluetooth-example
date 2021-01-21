import 'package:bell_delivery_hub/authentication_bloc/authentication_bloc.dart';
import 'package:bell_delivery_hub/authentication_bloc/repository/authentication_repository.dart';
import 'package:bell_delivery_hub/data/hive/hive_data_source.dart';
import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/login_bloc/login.dart';
import 'package:bell_delivery_hub/network/interceptors/dio_connectivity_request_retrier.dart';
import 'package:bell_delivery_hub/network/swipecomm_api.dart';
import 'package:bell_delivery_hub/theme/themes/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt inject = GetIt.instance;

Future<void> initDependencyInjection() async {
  // register http client and configure network
  _registerNetworkAndLocalDatabase();
  _registerBlocs();
  _registerRepository();
}

void _registerNetworkAndLocalDatabase() {
  // inject.registerLazySingleton(() => Dio());
  inject.registerSingleton(buildDio());

  inject.registerSingleton(SharedPreferences.getInstance());

  inject.registerSingleton(SwipeCommApi(inject.get<Dio>()));
  // inject.registerSingleton(SwipeCommApi(
  //   inject(),
  // ));
  inject.registerLazySingleton<LocalDataSource>(() => HiveDataSource());

  inject.registerLazySingleton(
    () => DioConnectivityRequestRetrier(connectivity: inject(), dio: inject()),
  );
}

void _registerBlocs() {
  inject.registerLazySingleton(() => ThemeCubit());

  inject.registerLazySingleton(() => AuthenticationBloc(inject()));

  inject.registerLazySingleton(() => LoginBloc(inject(), inject()));

}

void _registerRepository() {
  inject.registerLazySingleton(
    () => AuthenticationRepository(
        networkApi: inject(), localDataSource: inject()),
  );
}
