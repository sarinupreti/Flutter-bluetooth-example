part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetWalletBalance extends WalletEvent {
  GetWalletBalance();

  @override
  List<Object> get props => [];
}

class PostWalletBalance extends WalletEvent {
  final AddFundRequest addFundRequest;

  PostWalletBalance(this.addFundRequest);

  @override
  List<Object> get props => [];
}
