import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_category_image.g.dart';

@HiveType(typeId: HIVE_PRODUCT_CATEGORY_IMAGE_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductCategoryImage extends HiveObject implements Equatable {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String src;
  String name;
  String alt;

  ProductCategoryImage(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.src,
      this.name,
      this.alt});

  static const fromJson = _$ProductCategoryImageFromJson;

  Map<String, dynamic> toJson() => _$ProductCategoryImageToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
