// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_app/domain/data/local_data_source.dart';
// import 'package:woocommerce/woocommerce.dart';

// class WooCommerceRepository {
//   final LocalDataSource _localDataSource;
//   // ignore: unused_field
//   final WooCommerce _wooCommerceApi;

//   WooCommerceRepository({
//     @required LocalDataSource localDataSource,
//     @required WooCommerce wooCommerce,
//   })  : assert(localDataSource != null),
//         assert(wooCommerce != null),
//         _wooCommerceApi = wooCommerce,
//         _localDataSource = localDataSource;

//   Future<WooCommerce> getAuthCreds() async {
//     try {
//       final auth = await _localDataSource.getAuthFromLocal();

//       if (auth.websiteUrl.isNotEmpty &&
//           auth.consumerKey.isNotEmpty &&
//           auth.consumerSecret.isNotEmpty) {
//         WooCommerce response = WooCommerce(
//             baseUrl: auth.websiteUrl,
//             consumerKey: auth.consumerKey,
//             consumerSecret: auth.consumerSecret,
//             isDebug: !kReleaseMode);

//         return response;
//       } else {
//         return null;
//       }
//     } on WooCommerceError catch (e) {
//       print(e);

//       return null;
//     }
//   }
// }
