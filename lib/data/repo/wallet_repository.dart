import 'dart:io';

import 'package:bots_demo/globals/exveptions/network_exceptions.dart';
import 'package:bots_demo/data/local_data_source.dart';
import 'package:bots_demo/modal/api_response_status.dart';
import 'package:bots_demo/modal/transaction/request/payment_request.dart';
import 'package:bots_demo/modal/transaction/transaction.dart';
import 'package:bots_demo/modal/wallet/add_wallet_fund.dart';
import 'package:bots_demo/modal/wallet/request/add_refund_request.dart';
import 'package:bots_demo/modal/wallet/wallet.dart';
import 'package:bots_demo/network/network_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WalletRepository {
  final LocalDataSource _localDataSource;
  // ignore: unused_field
  final BotsNetworkApi _networkApi;
  // ignore: unused_field

  WalletRepository({
    @required LocalDataSource localDataSource,
    @required BotsNetworkApi networkApi,
  })  : assert(localDataSource != null),
        assert(networkApi != null),
        _networkApi = networkApi,
        _localDataSource = localDataSource;

  // ignore: missing_return
  Future<ApiResponseStatus<Wallet>> getWalletBalanceFromApi() async {
    try {
      final response = await _networkApi.getWalletBalance();
      if (response != null) {
        final walletData = Wallet.fromJson(response.data["wallet"]);

        await _localDataSource.cacheWallet(walletData);

        return ApiResponseStatus(
          data: walletData,
          isSuccessful: true,
          error: null,
        );
      } else {}
    } on DioError catch (error) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    } on SocketException catch (error) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(error));
    }
  }

  // ignore: missing_return
  Future<ApiResponseStatus<AddWalletFundResponse>> postWalletFund(
      AddFundRequest body) async {
    try {
      final response = await _networkApi.postAddFund(body);
      if (response != null) {
        final data = AddWalletFundResponse(
            url: response.data["url"], reference: response.data["reference"]);

        return ApiResponseStatus(
          data: data,
          isSuccessful: true,
          error: null,
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

  // ignore: missing_return
  Future<ApiResponseStatus<TransactionHistory>> payFund(
      PaymentRequest body) async {
    try {
      final response = await _networkApi.payFund(body);
      if (response != null && response.status == "success") {
        final data = TransactionHistory.fromJson(response.data["transaction"]);

        return ApiResponseStatus(
          data: data,
          isSuccessful: true,
          error: null,
        );
      } else {
        return ApiResponseStatus(
          data: null,
          isSuccessful: true,
          error: NetworkExceptions.defaultError(response.status),
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
