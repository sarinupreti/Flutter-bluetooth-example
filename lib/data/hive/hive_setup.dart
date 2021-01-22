import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/products/product_category.dart';
import 'package:bell_delivery_hub/modal/products/product_category_collection.dart';
import 'package:bell_delivery_hub/modal/products/product_category_image.dart';
import 'package:bell_delivery_hub/modal/products/product_category_self.dart';
import 'package:bell_delivery_hub/modal/products/product_default_attribute.dart';
import 'package:bell_delivery_hub/modal/products/product_dimension.dart';
import 'package:bell_delivery_hub/modal/products/product_download.dart';
import 'package:bell_delivery_hub/modal/products/product_image.dart';
import 'package:bell_delivery_hub/modal/products/product_item_attribute.dart';
import 'package:bell_delivery_hub/modal/products/product_item_tag.dart';
import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';
import 'package:bell_delivery_hub/modal/products/products.dart';
import 'package:bell_delivery_hub/modal/temp_login_creds.dart';
import 'package:bell_delivery_hub/modal/user.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveSetup {
  //

  // static Future _init;

  // Private constructor
  HiveSetup._();

  // Get stance of this class using instance getter
  // static HiveSetup get instance => HiveSetup._();

  static Future get initHive => _initHive();

  static Future _initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(WebsiteDataAdapter());
    Hive.registerAdapter(TempLoginCredsAdapter());
    Hive.registerAdapter(ProductsAdapter());
    Hive.registerAdapter(ProductDownloadAdapter());
    Hive.registerAdapter(ProductDimensionAdapter());
    Hive.registerAdapter(ProductCategoryAdapter());
    Hive.registerAdapter(ProductItemTagAdapter());
    Hive.registerAdapter(ProductImageAdapter());
    Hive.registerAdapter(ProductItemAttributeAdapter());
    Hive.registerAdapter(ProductDefaultAttributeAdapter());
    Hive.registerAdapter(MetaDataAdapter());
    Hive.registerAdapter(ProductCategorySelfAdapter());
    Hive.registerAdapter(ProductCategoryCollectionAdapter());
    Hive.registerAdapter(ProductCategoryImageAdapter());
    //
    //
  }
}

Future<void> clearHive() async {
  await Hive.deleteBoxFromDisk(HIVE_AUTH_BOX);
  await Hive.deleteBoxFromDisk(HIVE_USER_BOX);
  await Hive.deleteBoxFromDisk(HIVE_TEMP_CREDS);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCTS);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_DOWNLOAD);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_DIMENSION);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_CATEGORY);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_IMAGE);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_ITEM_ATTRIBUTE);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_DEFAULT_ATTRIBUTE);
  await Hive.deleteBoxFromDisk(HIVE_META_DATA);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_CATEGORY_IMAGE);
  await Hive.deleteBoxFromDisk(HIVE_PRODUCT_CATEGORY_LINKS);
  await Hive.deleteBoxFromDisk(HIVE_CATEGORY_SELF);
  await Hive.deleteBoxFromDisk(HIVE_CATEGORY_COLLECTIONS);
}

Future<void> clearAuthHive() async {
  await Hive.deleteBoxFromDisk(HIVE_AUTH_BOX);
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

Future<WebsiteData> getHiveAuthBox(bool isTemp) async {
  final websiteDataBox =
      isTemp ? await openBox(HIVE_TEMP_CREDS) : await openBox(HIVE_AUTH_BOX);
  if (websiteDataBox.isNotEmpty) {
    return await websiteDataBox.getAt(0);
  } else {
    final hiveUser = WebsiteData();
    await websiteDataBox.add(hiveUser);
    return await websiteDataBox.getAt(0);
  }
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

Future<List<T>> getListFromHiveBox<T>(String hiveBoxName) async {
  final hiveBox = await openBox(hiveBoxName);
  final List<T> list = List();
  for (var i = 0; i < hiveBox.length; i++) {
    list.add(await hiveBox.getAt(i) as T);
  }
  return list;
}
