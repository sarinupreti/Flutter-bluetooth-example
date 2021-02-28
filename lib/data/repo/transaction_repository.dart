import 'dart:io';

import 'package:bots_demo/data/local_data_source.dart';
import 'package:bots_demo/globals/exveptions/network_exceptions.dart';
import 'package:bots_demo/modal/api_response_status.dart';
import 'package:bots_demo/modal/transaction/transaction.dart';
import 'package:bots_demo/network/network_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TransactionRepository {
  final LocalDataSource _localDataSource;
  // ignore: unused_field
  final BotsNetworkApi _networkApi;
  // ignore: unused_field

  TransactionRepository({
    @required LocalDataSource localDataSource,
    @required BotsNetworkApi networkApi,
  })  : assert(localDataSource != null),
        assert(networkApi != null),
        _networkApi = networkApi,
        _localDataSource = localDataSource;

  // ignore: missing_return
  Future<ApiResponseStatus<List<TransactionHistory>>>
      // ignore: missing_return
      getTransactionHistory() async {
    try {
      final response = await _networkApi.getTransactionHistory();
      if (response != null) {
        final List<TransactionHistory> transactionHistory = response
            .data["transactions"]
            .map<TransactionHistory>((e) => TransactionHistory.fromJson(e))
            .toList();

        await _localDataSource.cachedTransactionHistory(
            history: transactionHistory);

        return ApiResponseStatus(
          data: transactionHistory,
          isSuccessful: true,
          error: null,
        );
      } else {
        return ApiResponseStatus(
          data: null,
          isSuccessful: false,
          error: NetworkExceptions.getDioException(response),
        );
      }
    } on DioError catch (error) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    } on SocketException catch (error) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    }
  }
}
