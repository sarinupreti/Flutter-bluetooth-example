import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_category_self.g.dart';

@HiveType(typeId: HIVE_CATEGORY_SELF_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductCategorySelf extends HiveObject implements Equatable {
  String href;

  ProductCategorySelf({this.href});

  static const fromJson = _$ProductCategorySelfFromJson;

  Map<String, dynamic> toJson() => _$ProductCategorySelfToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
