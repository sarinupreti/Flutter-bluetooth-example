import 'package:bell_delivery_hub/modal/products/products.dart';
import 'package:bell_delivery_hub/modal/user.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';

abstract class LocalDataSource {
  Future<WebsiteData> getAuthFromLocal(bool isTemp);
  Future<User> getUserFromLocal();

  Future<WebsiteData> cacheAuth(WebsiteData user, bool isTemp);
  Future<User> cacheUser(User user);
  Future<User> updateUser(User user);

  Future<void> logOut();
  Future<List<Products>> cacheProductList(List<Products> productData);
  Future<List<Products>> getCachedProducts();
}
