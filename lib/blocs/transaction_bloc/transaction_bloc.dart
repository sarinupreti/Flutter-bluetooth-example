import 'package:bloc/bloc.dart';
import 'package:bots_demo/data/repo/transaction_repository.dart';
import 'package:bots_demo/modal/transaction/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bots_demo/globals/exveptions/network_exceptions.dart';

part 'transaction_bloc.freezed.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _transactionRepository;

  TransactionBloc({TransactionRepository transactionRepository})
      : assert(transactionRepository != null),
        _transactionRepository = transactionRepository,
        super(TransactionState.initial());

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    yield* event.map(fetchHistory: (event) async* {
      yield TransactionState.loading();

      final response = await _transactionRepository.getTransactionHistory();

      if (response != null &&
          response.isSuccessful != null &&
          response.isSuccessful) {
        yield TransactionState.success(response.data);
      } else {
        yield TransactionState.failure(
            NetworkExceptions.getErrorMessage(response.error));
      }
    });
  }
}
