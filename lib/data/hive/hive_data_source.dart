import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/data/hive/hive_setup.dart';
import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/modal/products/products.dart';
import 'package:bell_delivery_hub/modal/user.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';

class HiveDataSource implements LocalDataSource {
  @override
  Future<WebsiteData> cacheAuth(WebsiteData auth, bool isTemp) async {
    final hiveUserBox = await getHiveAuthBox(isTemp);

    hiveUserBox.websiteUrl = auth.websiteUrl;
    hiveUserBox.consumerKey = auth.consumerKey;
    hiveUserBox.consumerSecret = auth.consumerSecret;
    hiveUserBox.isLegacy = auth.isLegacy;

    await hiveUserBox.save();
    return hiveUserBox;
  }

  Future<WebsiteData> getAuthFromLocal(bool isTemp) async {
    final hiveAuthBox = await getHiveAuthBox(isTemp);
    if (hiveAuthBox.websiteUrl != null &&
        hiveAuthBox.websiteUrl.isNotEmpty &&
        hiveAuthBox.consumerSecret != null &&
        hiveAuthBox.consumerSecret.isNotEmpty &&
        hiveAuthBox.consumerKey != null &&
        hiveAuthBox.consumerKey.isNotEmpty) {
      return hiveAuthBox;
    } else {
      return null;
    }
  }

  @override
  Future<void> logOut() async {
    await clearHive();
  }

  @override
  Future<List<Products>> cacheProductList(
    List<Products> productData,
  ) async {
    final hiveProductBox = await openBox(HIVE_PRODUCTS);
    final cachedProductListFromLocal =
        await getListFromHiveBox<Products>(HIVE_PRODUCTS);

    productData.asMap().forEach((index, data) {
      if (!cachedProductListFromLocal.contains(data))
        hiveProductBox.put(data.id, data);
    });
    final cachedProductList = await getCachedProducts();
    return cachedProductList;
  }

  @override
  Future<List<Products>> getCachedProducts() async {
    final cachedProductList = await getListFromHiveBox<Products>(HIVE_PRODUCTS);

    return cachedProductList.toList();
  }

  @override
  Future<User> cacheUser(User user) async {
    final hiveUserBox = await getHiveUserBox();

    hiveUserBox.name = user.name;
    hiveUserBox.email = user.email;
    hiveUserBox.emailVerified = user.emailVerified;
    hiveUserBox.creationTime = user.creationTime;
    hiveUserBox.lastSignInTime = user.lastSignInTime;
    hiveUserBox.phoneNumber = user.phoneNumber;
    hiveUserBox.photoURL = user.photoURL;
    hiveUserBox.providerType = user.providerType;
    hiveUserBox.uId = user.uId;
    hiveUserBox.connectedWebsites = user.connectedWebsites;

    await hiveUserBox.save();
    return hiveUserBox;
  }

  @override
  Future<User> updateUser(User user) async {
    final hiveUserBox = await getHiveUserBox();

    hiveUserBox.connectedWebsites = user.connectedWebsites;

    await hiveUserBox.save();
    return hiveUserBox;
  }

  @override
  Future<User> getUserFromLocal() async {
    final hiveUserBox = await getHiveUserBox();

    return hiveUserBox;
  }
}
