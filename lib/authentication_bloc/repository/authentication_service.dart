import 'dart:io';

import 'package:bell_delivery_hub/data/hive/hive_setup.dart';
import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/api_response_status.dart';
import 'package:bell_delivery_hub/modal/products/products.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:bell_delivery_hub/modal/woocommerce_error.dart';
import 'package:bell_delivery_hub/network/swipecomm_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationService {
  Future<WebsiteData> saveAuth(WebsiteData user, bool isTemp);
  Future<WebsiteData> getAuth();
  Future<void> logOut();
  Future<ApiResponseStatus<List<Products>>> connectWebsiteData(
      WebsiteData creds);
}

class AuthenticationRepository extends AuthenticationService {
  final LocalDataSource _localDataSource;
  // ignore: unused_field
  final SwipeCommApi _networkApi;
  // ignore: unused_field

  AuthenticationRepository({
    @required LocalDataSource localDataSource,
    @required SwipeCommApi networkApi,
  })  : assert(localDataSource != null),
        assert(networkApi != null),
        _networkApi = networkApi,
        _localDataSource = localDataSource;

  @override
  Future<ApiResponseStatus<List<Products>>> connectWebsiteData(
      WebsiteData creds) async {
    try {
      await _localDataSource.cacheAuth(creds, false);

      final readResponse = await _networkApi.getProducts();

      if (readResponse != null) {
        final writeResponse = await _networkApi.createProduct();

        if (writeResponse.id != null) {
          await _networkApi.deleteProduct(writeResponse.id);
        }
      }

      await _localDataSource.cacheAuth(creds, false);

      return ApiResponseStatus(
        data: [],
        isSuccessful: true,
        error: null,
      );
    } on DioError catch (error) {
      await clearAuthHive();

      if (error != null &&
              error.response != null &&
              error.response.data["code"] ==
                  "woocommerce_rest_authentication_error" ||
          error.response.data["code"] == "woocommerce_rest_cannot_view") {
        return ApiResponseStatus(
            isSuccessful: false,
            error: NetworkExceptions.getDioException(error));
      }

      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    } on WooCommerceError catch (error) {
      await clearAuthHive();

      return ApiResponseStatus(
          data: null,
          isSuccessful: false,
          error: NetworkExceptions.getDioException(error));
    } on SocketException catch (error) {
      await clearAuthHive();

      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<WebsiteData> saveAuth(WebsiteData user, bool isTemp) async {
    await _localDataSource.cacheAuth(user, isTemp);
    return user;
  }

  @override
  Future<WebsiteData> getAuth() async {
    final auth = await _localDataSource.getAuthFromLocal(false);
    return auth;
  }

  @override
  Future<void> logOut() async {
    await _localDataSource.logOut();
  }
}
