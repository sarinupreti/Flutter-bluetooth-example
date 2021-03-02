import 'package:bots_demo/data/hive/hive_const.dart';
import 'package:bots_demo/modal/transaction/transaction.dart';
import 'package:bots_demo/modal/user/user.dart';
import 'package:bots_demo/modal/wallet/wallet.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveSetup {
  HiveSetup._();

  static Future get initHive => _initHive();

  static Future _initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(WalletAdapter());
    Hive.registerAdapter(TransactionHistoryAdapter());

    //
    //
  }
}

Future<void> clearHive() async {
  await Hive.deleteBoxFromDisk(HIVE_USER_BOX);
  await Hive.deleteBoxFromDisk(HIVE_WALLET_BOX);
  await Hive.deleteBoxFromDisk(HIVE_TRANSACTION_BOX);
}

Future<void> clearAuthHive() async {
  await Hive.deleteBoxFromDisk(HIVE_USER_BOX);
}

Future<void> clearHiveBox(String boxName) async {
  // await Hive.deleteBoxFromDisk(HIVE_USER_BOX);
  await Hive.deleteBoxFromDisk(boxName);
}

Future<LazyBox> openBox(String name) async {
  return Hive.isBoxOpen(name)
      ? Hive.lazyBox(name)
      : await Hive.openLazyBox(name);
}

Future<User> getHiveUserBox() async {
  final userBox = await openBox(HIVE_USER_BOX);
  if (userBox.isNotEmpty) {
    return await userBox.getAt(0);
  } else {
    final hiveUser = User();
    await userBox.add(hiveUser);
    return await userBox.getAt(0);
  }
}

Future<T> getHiveBoxData<T>(String name) async {
  final userBox = await openBox(name);
  if (userBox.isNotEmpty) {
    return await userBox.getAt(0);
  } else {
    final hiveUser = T;
    await userBox.add(hiveUser);
    return await userBox.getAt(0);
  }
}

Future<List<T>> getListFromHiveBox<T>(String hiveBoxName) async {
  final hiveBox = await openBox(hiveBoxName);
  final List<T> list = List();
  for (var i = 0; i < hiveBox.length; i++) {
    list.add(await hiveBox.getAt(i) as T);
  }
  return list;
}
