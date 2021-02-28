// lib/blocs/Wallet/Wallet_state.dart

part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletSuccess extends WalletState {
  final Wallet walletData;
  final AddWalletFundResponse postWalletResponse;

  WalletSuccess({
    this.postWalletResponse,
    this.walletData,
  });

  WalletSuccess copyWith({
    Wallet walletData,
    AddWalletFundResponse postWalletResponse,
  }) {
    return WalletSuccess(
      walletData: walletData ?? this.walletData,
      postWalletResponse: postWalletResponse ?? this.postWalletResponse,
    );
  }
}

class WalletFailure extends WalletState {
  final String error;

  WalletFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
