import 'dart:io';

import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/api_response_status.dart';
import 'package:bell_delivery_hub/modal/order/order.dart';
import 'package:bell_delivery_hub/modal/woocommerce_error.dart';
import 'package:bell_delivery_hub/network/swipecomm_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OrderRepository {
  final LocalDataSource _localDataSource;
  // ignore: unused_field
  final SwipeCommApi _networkApi;
  // ignore: unused_field

  OrderRepository({
    @required LocalDataSource localDataSource,
    @required SwipeCommApi networkApi,
  })  : assert(localDataSource != null),
        assert(networkApi != null),
        _networkApi = networkApi,
        _localDataSource = localDataSource;

  @override
  Future<ApiResponseStatus<List<Order>>> getAllOdersFromApi() async {
    try {
      final data = await _networkApi.getAllOrders();

      if (data != null) {
        return ApiResponseStatus(
          data: data,
          isSuccessful: true,
          error: null,
        );
      }else{
          return ApiResponseStatus(
          data: [],
          isSuccessful: false,
          error: null,
        );
      }
    } on DioError catch (error) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    } on WooCommerceError catch (error) {
      return ApiResponseStatus(
          data: null,
          isSuccessful: false,
          error: NetworkExceptions.getDioException(error));
    } on SocketException catch (error) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    }
  }
}
