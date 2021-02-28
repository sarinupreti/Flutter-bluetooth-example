import 'package:bots_demo/modal/transaction/transaction.dart';
import 'package:bots_demo/modal/user/user.dart';
import 'package:bots_demo/modal/wallet/wallet.dart';

abstract class LocalDataSource {
  Future<User> getUserFromLocal();
  Future<User> cacheUser(User user);
  Future<User> updateUser(User user);

  Future<Wallet> cacheWallet(Wallet wallet);
  Future<Wallet> getLocalDataWallet();

  Future<List<TransactionHistory>> cachedTransactionHistory(
      {List<TransactionHistory> history});
  Future<List<TransactionHistory>> getTransactionFromHistory();

  Future<void> logOut();
}
