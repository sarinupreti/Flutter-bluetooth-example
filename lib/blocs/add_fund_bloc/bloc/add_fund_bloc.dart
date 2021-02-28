import 'dart:async';

import 'package:bell_delivery_hub/data/repo/wallet_repository.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/wallet/add_wallet_fund.dart';
import 'package:bell_delivery_hub/modal/wallet/request/add_refund_request.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_fund_event.dart';
part 'add_fund_state.dart';

// class AddFundBloc extends Bloc<AddFundEvent, AddFundState> {
//   AddFundBloc() : super(AddFundInitial());

//   @override
//   Stream<AddFundState> mapEventToState(
//     AddFundEvent event,
//   ) async* {
//     // TODO: implement mapEventToState
//   }
// }

class AddFundBloc extends Bloc<AddFundEvent, AddFundState> {
  final WalletRepository _walletRepository;

  AddFundBloc({WalletRepository walletRepository})
      : assert(walletRepository != null),
        _walletRepository = walletRepository,
        super(AddFundInitial());

  @override
  Stream<AddFundState> mapEventToState(AddFundEvent event) async* {
    if (event is AddFundToAccount) {
      yield* _mapPostWalletBalance(event);
    }
  }

  Stream<AddFundState> _mapPostWalletBalance(AddFundToAccount event) async* {
    yield AddFundLoading();
    try {
      final data = await _walletRepository.postWalletFund(event.addFundRequest);
      if (data.isSuccessful) {
        yield AddFundSuccess(postAddFundResponse: data.data);
      } else {
        yield AddFundFailure(
            error: NetworkExceptions.getErrorMessage(data.error));
      }
    } on Exception catch (e) {
      yield AddFundFailure(error: e.toString());
    }
  }
}
