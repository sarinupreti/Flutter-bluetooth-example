import 'package:bots_demo/blocs/add_fund_bloc/bloc/add_fund_bloc.dart';
import 'package:bots_demo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bots_demo/blocs/pay_fund_bloc/pay_fund_bloc.dart';
import 'package:bots_demo/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:bots_demo/data/repo/authentication_service.dart';
import 'package:bots_demo/blocs/login_bloc/login_bloc.dart';
import 'package:bots_demo/data/repo/transaction_repository.dart';
import 'package:bots_demo/data/repo/wallet_repository.dart';
import 'package:bots_demo/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:bots_demo/data/hive/hive_data_source.dart';
import 'package:bots_demo/data/local_data_source.dart';
import 'package:bots_demo/network/interceptors/dio_connectivity_request_retrier.dart';
import 'package:bots_demo/network/network_api.dart';
import 'package:bots_demo/theme/themes/theme_cubit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.instance;

Future<void> initDependencyInjection() async {
  // register http client and configure network
  _registerNetworkAndLocalDatabase();
  _registerBlocs();
  _registerRepository();
}

void _registerNetworkAndLocalDatabase() {
  inject.registerSingleton(buildDio());
  inject.registerSingleton(BotsNetworkApi(inject.get<Dio>()));
  inject.registerLazySingleton<LocalDataSource>(() => HiveDataSource());
  inject.registerLazySingleton(() => Connectivity());
  inject.registerLazySingleton(
    () => DioConnectivityRequestRetrier(connectivity: inject(), dio: inject()),
  );
}

void _registerBlocs() {
  inject.registerLazySingleton(() => ThemeCubit());
  inject.registerLazySingleton(() => AuthenticationRepository(
      networkApi: inject(), localDataSource: inject()));

  inject.registerLazySingleton(() => WalletRepository(
        networkApi: inject(),
        localDataSource: inject(),
      ));
  inject.registerLazySingleton(() =>
      TransactionRepository(networkApi: inject(), localDataSource: inject()));

  //BLOCS//
  inject.registerLazySingleton(() => AddFundBloc(walletRepository: inject()));
  inject.registerLazySingleton(() => AuthenticationBloc(inject()));
  inject.registerLazySingleton(() => LoginBloc(inject(), inject()));
  inject.registerLazySingleton(() => PayFundBloc(walletRepository: inject()));
  inject.registerLazySingleton(() => WalletBloc(walletRepository: inject()));
  inject.registerLazySingleton(
      () => TransactionBloc(transactionRepository: inject()));
}

void _registerRepository() {}
