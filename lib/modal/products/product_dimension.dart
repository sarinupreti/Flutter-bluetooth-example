import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_dimension.g.dart';

@HiveType(typeId: HIVE_PRODUCT_DIMENSION_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductDimension extends HiveObject implements Equatable {
  @HiveField(0)
  final String length;
  @HiveField(1)
  final String width;
  @HiveField(2)
  final String height;

  ProductDimension({this.length, this.height, this.width});

  static const fromJson = _$ProductDimensionFromJson;

  Map<String, dynamic> toJson() => _$ProductDimensionToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
