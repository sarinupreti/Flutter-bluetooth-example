part of 'transaction_bloc.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _TransactionStateInitial;
  const factory TransactionState.loading() = _TransactionStateLoading;
  const factory TransactionState.success(List<TransactionHistory> history) =
      _TransactionStateSuccess;
  const factory TransactionState.failure(String message) =
      _TransactionStateFailure;
}
