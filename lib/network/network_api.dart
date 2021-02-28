import 'package:bots_demo/network/urls.dart';
import 'package:bots_demo/blocs/authentication_bloc/authentication.dart';
import 'package:bots_demo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bots_demo/data/local_data_source.dart';
import 'package:bots_demo/globals/navigation.dart';
import 'package:bots_demo/modal/base_response.dart';
import 'package:bots_demo/modal/login/request/login_request.dart';
import 'package:bots_demo/modal/transaction/request/payment_request.dart';
import 'package:bots_demo/modal/wallet/request/add_refund_request.dart';
import 'package:bots_demo/utils/dependency_injection.dart';
import "package:dio/dio.dart" hide Headers;
import 'package:flutter/material.dart';
import "package:retrofit/retrofit.dart";
import 'urls.dart';
import 'package:bots_demo/extensions/flash_util.dart';

part 'network_api.g.dart';

const DEFAULT_CONNECTION_TIMEOUT = const Duration(seconds: 10);
const DEFAULT_RECEIVE_TIMEOUT = const Duration(seconds: 10);

CancelToken cancelToken = CancelToken();

@RestApi(baseUrl: baseUrl)
abstract class BotsNetworkApi {
  factory BotsNetworkApi(Dio dio, {String baseUrl}) = _BotsNetworkApi;

  @POST("$loginEndpoint")
  Future<BaseResponse> loginWithCreds(
    @Body() LoginRequest body,
  );

  @GET("$getWalletUrl")
  Future<BaseResponse> getWalletBalance();

  @POST("$fundWalletUrl")
  Future<BaseResponse> postAddFund(
    @Body() AddFundRequest body,
  );

  @GET("$transactionHistory")
  Future<BaseResponse> getTransactionHistory();

  //
  @POST("$tranferMoney")
  Future<BaseResponse> payFund(
    @Body() PaymentRequest body,
  );
}

Dio buildDio() {
  BaseOptions options = BaseOptions(
    connectTimeout: DEFAULT_CONNECTION_TIMEOUT.inMilliseconds,
    receiveTimeout: DEFAULT_RECEIVE_TIMEOUT.inMilliseconds,
  );

  final dio = Dio(options)
    ..interceptors.addAll(
      [
        LogInterceptor(
          error: true,
          logPrint: (object) => debugPrint(object),
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
        InterceptorsWrapper(
          onRequest: (RequestOptions request) async {
            LocalDataSource localDataSource = inject<LocalDataSource>();

            final auth = await localDataSource.getUserFromLocal();

            if (auth != null && auth.token != null) {
              request.headers
                  .putIfAbsent("Authorization", () => "Bearer ${auth.token}");
            }
          },
          onResponse: (Response response) async {},
          onError: (DioError e) async {
            if (e.request.path != loginEndpoint) if (e.response.statusCode ==
                    404 ||
                e.response.statusCode == 503 ||
                e.response.statusCode == 500) {
              inject<AuthenticationBloc>().add(UserLoggedOut());

              globalNavigatorKey.currentState.context.showStatusBar(
                message: "Your session has been expired. Please login again.",
                icon: null,
              );
            }

            // }
          },
        ),
      ],
    );

  return dio;
}
