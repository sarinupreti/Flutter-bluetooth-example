import 'dart:async';

import 'package:bots_demo/data/repo/wallet_repository.dart';
import 'package:bots_demo/globals/exveptions/network_exceptions.dart';
import 'package:bots_demo/modal/wallet/add_wallet_fund.dart';
import 'package:bots_demo/modal/wallet/request/add_refund_request.dart';
import 'package:bots_demo/modal/wallet/wallet.dart';
import 'package:bots_demo/network/urls.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository _walletRepository;

  WalletBloc({WalletRepository walletRepository})
      : assert(walletRepository != null),
        _walletRepository = walletRepository,
        super(WalletInitial());

  @override
  Stream<WalletState> mapEventToState(WalletEvent event) async* {
    if (event is GetWalletBalance) {
      yield* _mapWalletBalanceEvent(event);
    }

    if (event is PostWalletBalance) {
      yield* _mapPostWalletBalance(event);
    }
  }

  Stream<WalletState> _mapWalletBalanceEvent(GetWalletBalance event) async* {
    yield WalletLoading();
    try {
      final data = await _walletRepository.getWalletBalanceFromApi();
      if (data.isSuccessful) {
        yield WalletSuccess().copyWith(walletData: data.data);
      } else {
        yield WalletFailure(
            error: NetworkExceptions.getErrorMessage(data.error));
      }
    } on Exception catch (e) {
      yield WalletFailure(error: e.toString());
    }
  }

  Stream<WalletState> _mapPostWalletBalance(PostWalletBalance event) async* {
    yield WalletLoading();
    try {
      final data = await _walletRepository.postWalletFund(event.addFundRequest);
      if (data.isSuccessful) {
        yield WalletSuccess().copyWith(postWalletResponse: data.data);
      } else {
        yield WalletFailure(
            error: NetworkExceptions.getErrorMessage(data.error));
      }
    } on Exception catch (e) {
      yield WalletFailure(error: e.toString());
    }
  }
}
