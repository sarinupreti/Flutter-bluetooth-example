import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_item_attribute.g.dart';

@HiveType(typeId: HIVE_PRODUCT_ITEM_ATTRIBUTE_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductItemAttribute extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int position;
  @HiveField(3)
  final bool visible;
  @HiveField(4)
  final bool variation;
  @HiveField(5)
  final List<String> options;

  ProductItemAttribute(
      {this.id,
      this.name,
      this.position,
      this.visible,
      this.variation,
      this.options});

  static const fromJson = _$ProductItemAttributeFromJson;

  Map<String, dynamic> toJson() => _$ProductItemAttributeToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
