import 'dart:io';

import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/api_response_status.dart';
import 'package:bell_delivery_hub/modal/products/products.dart';
import 'package:bell_delivery_hub/modal/user.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:bell_delivery_hub/modal/woocommerce_error.dart';
import 'package:bell_delivery_hub/network/swipecomm_api.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

class AuthenticationRepository {
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

  Future<User> isLoggedIn() async {
    final user = await _localDataSource.getUserFromLocal();
    return user;
  }

  Future<ApiResponseStatus<List<Products>>> connectWebsiteData(
      WebsiteData creds) async {
    try {
      await _localDataSource.cacheAuth(creds, false);

      final readResponse = await _networkApi.getProducts(1, 10);

      if (readResponse != null) {
        final writeResponse = await _networkApi.createProduct();

        print(writeResponse);

        if (writeResponse.id != null) {
          await _networkApi.deleteProduct(writeResponse.id);
        }
      }
      return ApiResponseStatus(
        data: [],
        isSuccessful: true,
        error: null,
      );
    } on DioError catch (error) {
      print(error);

      if (error != null &&
          error.response != null &&
          error.response.data["code"] ==
              "woocommerce_rest_authentication_error") {
        return ApiResponseStatus(
            isSuccessful: false,
            error: NetworkExceptions.getDioException(error));
      }

      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    } on WooCommerceError catch (error) {
      print(error);
      return ApiResponseStatus(
          data: null,
          isSuccessful: false,
          error: NetworkExceptions.getDioException(error));
    } on SocketException catch (error) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    }
  }

  Future<WebsiteData> saveAuth(WebsiteData user, bool isTemp) async {
    await _localDataSource.cacheAuth(user, isTemp);
    return user;
  }

  Future<User> saveUser(User user) async {
    await _localDataSource.cacheUser(
      user,
    );
    return user;
  }

  Future<User> updateUser(User user) async {
    await _localDataSource.updateUser(
      user,
    );
    return user;
  }

  Future<WebsiteData> getAuth() async {
    final auth = await _localDataSource.getAuthFromLocal(false);
    return auth;
  }

  Future<User> getUserFromLocal() async {
    final user = await _localDataSource.getUserFromLocal();
    return user;
  }

  Future<void> logOut() async {
    await _localDataSource.logOut();
  }
}
