import 'dart:convert';

import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/modal/products/products.dart';
import 'package:bell_delivery_hub/network/urls.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import "package:dio/dio.dart" hide Headers;
import 'package:flutter/material.dart';
import "package:retrofit/retrofit.dart";

part 'swipecomm_api.g.dart';

const DEFAULT_CONNECTION_TIMEOUT = const Duration(seconds: 10);
const DEFAULT_RECEIVE_TIMEOUT = const Duration(seconds: 10);

CancelToken cancelToken = CancelToken();

@RestApi(baseUrl: baseUrl)
abstract class SwipeCommApi {
  factory SwipeCommApi(Dio dio, {String baseUrl}) = _SwipeCommApi;

  @GET("$getAllProducts")
  Future<List<Products>> getProducts(
      @Query("page") int page, @Query("per_page") int perPage);

  @POST("$getAllProducts")
  Future<Products> createProduct();

  @DELETE("$getAllProducts/{id}")
  Future<Products> deleteProduct(
    @Path("id") int id,
  );

  @GET("$getAllProducts")
  Future<List<Products>> getDraftProducts(@Query("page") int page,
      @Query("status") String status, @Query("per_page") int perPage);

  @GET("$getAllProducts")
  Future<List<Products>> searchProductsByName(
    @Query("search") String search,
  );

  @GET("$getAllProducts")
  Future<List<Products>> searchProductsBySKU(@Query("sku") String sku);
}

Dio buildDio() {
  BaseOptions options = BaseOptions(
    connectTimeout: DEFAULT_CONNECTION_TIMEOUT.inMilliseconds,
    receiveTimeout: DEFAULT_RECEIVE_TIMEOUT.inMilliseconds,
  );
  // final deviceData = GetDeviceInfo.deviceData;
  // if (deviceData != null)
  //   options.headers["user-agent"] =
  //       "Linux; ${deviceData['deviceType']} ${deviceData['version.release']}; ${deviceData['model']} Build/${deviceData['id']} MC${deviceData['devicePlatform']}/${deviceData['appVersion']}";

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
            final localDataSource = inject<LocalDataSource>();

            final auth = await localDataSource.getAuthFromLocal(false);

            request.baseUrl = auth?.websiteUrl;

            // final decruptedCK = await auth.consumerKey.decryptString();
            // final decruptedCS = await auth.consumerSecret.decryptString();

            final decruptedCK = auth.consumerKey;
            final decruptedCS = auth.consumerSecret;

            print(decruptedCK);
            print(decruptedCS);

            if (auth != null && auth.isLegacy) {
              request.queryParameters
                  .putIfAbsent("consumer_key", () => decruptedCK);
              request.queryParameters
                  .putIfAbsent("consumer_secret", () => decruptedCS);
            } else {
              String basicAuth = 'Basic ' +
                  base64Encode(utf8.encode('$decruptedCK:$decruptedCS'));
              request.headers.putIfAbsent("Authorization", () => basicAuth);
            }

            print(request);
          },
          onResponse: (Response response) async {
            print(response);
          },
          onError: (DioError e) async {
            // inject<AuthenticationBloc>().add(AuthenticationEvent.logOut());

            // globalNavigatorKey.currentState.context.showStatusBar(
            //   message: "Your session has been expired. Please login again.",
            //   icon: null,
            // );
            // // }
          },
        ),
      ],
    );

  return dio;
}
