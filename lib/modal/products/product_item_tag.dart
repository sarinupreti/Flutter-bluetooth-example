import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_item_tag.g.dart';

@HiveType(typeId: HIVE_PRODUCT_ITEM_TAG_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductItemTag extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String slug;

  ProductItemTag({this.id, this.name, this.slug});

  static const fromJson = _$ProductItemTagFromJson;

  Map<String, dynamic> toJson() => _$ProductItemTagToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
