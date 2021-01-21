import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/products/product_category_image.dart';
import 'package:bell_delivery_hub/modal/products/product_category_links.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_category.g.dart';

@HiveType(typeId: HIVE_PRODUCT_CATEGORY_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductCategory extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String slug;
  @HiveField(3)
  int parent;
  @HiveField(4)
  String description;
  @HiveField(5)
  String display;
  @HiveField(6)
  ProductCategoryImage image;
  @HiveField(7)
  int menuOrder;
  @HiveField(8)
  int count;
  @HiveField(9)
  ProductCategoryLinks links;

  ProductCategory(
      {this.id,
      this.name,
      this.slug,
      this.parent,
      this.description,
      this.display,
      this.image,
      this.menuOrder,
      this.count,
      this.links});

  static const fromJson = _$ProductCategoryFromJson;

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
