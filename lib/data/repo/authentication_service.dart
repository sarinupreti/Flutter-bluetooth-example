import 'dart:io';

import 'package:bell_delivery_hub/data/hive/hive_setup.dart';
import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/api_response_status.dart';
import 'package:bell_delivery_hub/modal/login/request/login_request.dart';
import 'package:bell_delivery_hub/modal/user/user.dart';
import 'package:bell_delivery_hub/network/network_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationService {
  Future<User> saveAuth(User user);
  Future<User> getAuth();
  Future<void> logOut();
}

class AuthenticationRepository extends AuthenticationService {
  final LocalDataSource _localDataSource;
  // ignore: unused_field
  final BotsNetworkApi _networkApi;
  // ignore: unused_field

  AuthenticationRepository({
    @required LocalDataSource localDataSource,
    @required BotsNetworkApi networkApi,
  })  : assert(localDataSource != null),
        assert(networkApi != null),
        _networkApi = networkApi,
        _localDataSource = localDataSource;

  @override
  Future<User> saveAuth(User user) async {
    await _localDataSource.cacheUser(user);
    return user;
  }

  @override
  Future<User> getAuth() async {
    final auth = await _localDataSource.getUserFromLocal();
    return auth;
  }

  @override
  Future<void> logOut() async {
    await _localDataSource.logOut();
  }

  // ignore: missing_return
  Future<ApiResponseStatus<User>> loginWithCreds(LoginRequest creds) async {
    try {
      final response = await _networkApi.loginWithCreds(creds);
      if (response != null) {
        final user = User.fromJson(response.data["user"]);

        final data = user.copyWith(token: response.token);

        if (data.token != null) {
          await _localDataSource.cacheUser(data);
        }

        return ApiResponseStatus(
          data: data,
          isSuccessful: true,
          error: null,
        );
      } else {}
    } on DioError catch (error) {
      await clearAuthHive();

      if (error != null && error.response != null) {
        return ApiResponseStatus(
            isSuccessful: false,
            error: NetworkExceptions.getDioException(error));
      } else {
        return ApiResponseStatus(
            isSuccessful: false,
            error: NetworkExceptions.getDioException(error));
      }
    } on SocketException catch (error) {
      await clearAuthHive();

      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    }
  }
}
