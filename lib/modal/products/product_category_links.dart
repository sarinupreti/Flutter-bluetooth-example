import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/products/product_category_collection.dart';
import 'package:bell_delivery_hub/modal/products/product_category_self.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_category_links.g.dart';

@HiveType(typeId: HIVE_PRODUCT_CATEGORY_LINKS_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductCategoryLinks extends HiveObject implements Equatable {
  List<ProductCategorySelf> self;
  List<ProductCategoryCollection> collection;

  ProductCategoryLinks({this.self, this.collection});

  static const fromJson = _$ProductCategoryLinksFromJson;

  Map<String, dynamic> toJson() => _$ProductCategoryLinksToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
