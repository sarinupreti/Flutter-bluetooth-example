import 'package:bell_delivery_hub/modal/user/user.dart';
import 'package:bell_delivery_hub/modal/wallet/wallet.dart';

abstract class LocalDataSource {
  Future<User> getUserFromLocal();
  Future<User> cacheUser(User user);
  Future<User> updateUser(User user);

  Future<Wallet> cacheWallet(Wallet wallet);
  Future<Wallet> getLocalDataWallet();

  Future<void> logOut();
}
