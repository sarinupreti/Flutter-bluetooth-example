import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_default_attribute.g.dart';

@HiveType(typeId: HIVE_PRODUCT_DEFAULT_ATTRIBUTE_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductDefaultAttribute extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String option;

  ProductDefaultAttribute({this.id, this.name, this.option});

  static const fromJson = _$ProductDefaultAttributeFromJson;

  Map<String, dynamic> toJson() => _$ProductDefaultAttributeToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
