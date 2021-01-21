import 'package:bell_delivery_hub/authentication_bloc/authentication_bloc.dart';
import 'package:bell_delivery_hub/authentication_bloc/repository/authentication_repository.dart';
import 'package:bell_delivery_hub/authentication_bloc/repository/firebase_repository.dart';
import 'package:bell_delivery_hub/data/hive/hive_data_source.dart';
import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/network/interceptors/dio_connectivity_request_retrier.dart';
import 'package:bell_delivery_hub/network/swipecomm_api.dart';
import 'package:bell_delivery_hub/theme/themes/theme_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  inject.registerSingleton(FirebaseAuth.instance);

  inject.registerSingleton(FirebaseFirestore.instance);

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

  inject.registerLazySingleton(() => AuthenticationBloc(
      authenticationRepository: inject(), firebaseRepository: inject()));
}

void _registerRepository() {
  inject.registerLazySingleton(
    () => AuthenticationRepository(
        networkApi: inject(), localDataSource: inject()),
  );

  inject.registerLazySingleton(() => FirebaseRepository(
      firebaseAuth: inject(),
      firebaseFirestore: inject(),
      localDataSource: inject()));
}
