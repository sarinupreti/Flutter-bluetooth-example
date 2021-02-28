part of 'pay_fund_bloc.dart';

abstract class PayFundState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFundInitial extends PayFundState {}

class AddFundLoading extends PayFundState {}

class AddFundSuccess extends PayFundState {
  final TransactionHistory transactionHistory;

  AddFundSuccess({
    this.transactionHistory,
  });
}

class AddFundFailure extends PayFundState {
  final String error;

  AddFundFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
