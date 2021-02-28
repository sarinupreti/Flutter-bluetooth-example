import 'dart:async';

import 'package:bots_demo/data/repo/wallet_repository.dart';
import 'package:bots_demo/globals/exveptions/network_exceptions.dart';
import 'package:bots_demo/modal/transaction/request/payment_request.dart';
import 'package:bots_demo/modal/transaction/transaction.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'pay_fund_event.dart';
part 'pay_fund_state.dart';

class PayFundBloc extends Bloc<PayFundEvent, PayFundState> {
  final WalletRepository _walletRepository;

  PayFundBloc({WalletRepository walletRepository})
      : assert(walletRepository != null),
        _walletRepository = walletRepository,
        super(AddFundInitial());

  @override
  Stream<PayFundState> mapEventToState(PayFundEvent event) async* {
    if (event is PayFundToAccount) {
      yield* _mapPostWalletBalance(event);
    }
  }

  Stream<PayFundState> _mapPostWalletBalance(PayFundToAccount event) async* {
    yield AddFundLoading();
    try {
      final data = await _walletRepository.payFund(event.paymentRequest);
      if (data.isSuccessful) {
        yield AddFundSuccess(transactionHistory: data.data);
      } else {
        yield AddFundFailure(
            error: NetworkExceptions.getErrorMessage(data.error));
      }
    } on Exception catch (e) {
      yield AddFundFailure(error: e.toString());
    }
  }
}
