import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_image.g.dart';

@HiveType(typeId: HIVE_PRODUCT_IMAGE_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ProductImage extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final DateTime dateCreated;
  @HiveField(2)
  final DateTime dateCreatedGMT;
  @HiveField(3)
  final DateTime dateModified;
  @HiveField(4)
  final DateTime dateModifiedGMT;
  @HiveField(5)
  final String src;
  @HiveField(6)
  final String name;
  @HiveField(7)
  final String alt;

  ProductImage(
      {this.id,
      this.src,
      this.name,
      this.alt,
      this.dateCreated,
      this.dateCreatedGMT,
      this.dateModified,
      this.dateModifiedGMT});

  static const fromJson = _$ProductImageFromJson;

  Map<String, dynamic> toJson() => _$ProductImageToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
