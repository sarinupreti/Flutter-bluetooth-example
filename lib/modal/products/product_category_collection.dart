import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_category_collection.g.dart';

@HiveType(typeId: HIVE_CATEGORY_COLLECTIONS_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductCategoryCollection extends HiveObject implements Equatable {
  String href;

  ProductCategoryCollection({this.href});

  static const fromJson = _$ProductCategoryCollectionFromJson;

  Map<String, dynamic> toJson() => _$ProductCategoryCollectionToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
