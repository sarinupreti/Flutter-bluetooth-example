part of 'add_fund_bloc.dart';

abstract class AddFundState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFundInitial extends AddFundState {}

class AddFundLoading extends AddFundState {}

class AddFundSuccess extends AddFundState {
  final AddWalletFundResponse postAddFundResponse;

  AddFundSuccess({
    this.postAddFundResponse,
  });

  AddFundSuccess copyWith({
    AddWalletFundResponse postAddFundResponse,
  }) {
    return AddFundSuccess(
      postAddFundResponse: postAddFundResponse ?? this.postAddFundResponse,
    );
  }
}

class AddFundFailure extends AddFundState {
  final String error;

  AddFundFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
