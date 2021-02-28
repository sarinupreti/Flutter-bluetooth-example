import 'package:bots_demo/data/hive/hive_const.dart';
import 'package:bots_demo/data/hive/hive_setup.dart';
import 'package:bots_demo/data/local_data_source.dart';
import 'package:bots_demo/modal/user/user.dart';
import 'package:bots_demo/modal/wallet/wallet.dart';

class HiveDataSource implements LocalDataSource {
  @override
  Future<void> logOut() async {
    await clearHive();
  }

  @override
  Future<User> cacheUser(User user) async {
    final hiveUserBox = await getHiveUserBox();

    hiveUserBox.id = user.id;
    hiveUserBox.name = user.name;
    hiveUserBox.email = user.email;
    hiveUserBox.createdAt = user.createdAt;
    hiveUserBox.updatedAt = user.updatedAt;
    hiveUserBox.token = user.token;

    await hiveUserBox.save();
    return hiveUserBox;
  }

  @override
  Future<User> updateUser(User user) async {
    final hiveUserBox = await getHiveUserBox();

    hiveUserBox.updatedAt = user.updatedAt;
    hiveUserBox.token = user.token;

    await hiveUserBox.save();
    return hiveUserBox;
  }

  @override
  Future<User> getUserFromLocal() async {
    final hiveUserBox = await getHiveUserBox();

    return hiveUserBox;
  }

  @override
  Future<Wallet> cacheWallet(Wallet wallet) async {
    final hiveProductBox = await openBox(HIVE_WALLET_BOX);

    hiveProductBox.put(wallet.id, wallet);
    final cachedProductList = await getLocalDataWallet();
    return cachedProductList;
  }

  @override
  Future<Wallet> getLocalDataWallet() async {
    final cachedProductList = await getHiveBoxData<Wallet>(HIVE_WALLET_BOX);

    return cachedProductList;
  }
}
