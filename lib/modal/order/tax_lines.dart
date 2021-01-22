import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';

import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'tax_lines.g.dart';

@HiveType(typeId: HIVE_SHIPPING_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class TaxLines extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String rateCode;
  @HiveField(2)
  int rateId;
  @HiveField(3)
  String label;
  @HiveField(4)
  bool compound;
  @HiveField(5)
  String taxTotal;
  @HiveField(6)
  String shippingTaxTotal;
  @HiveField(7)
  List<MetaData> metaData;

  TaxLines(
      {this.id,
      this.rateCode,
      this.rateId,
      this.label,
      this.compound,
      this.taxTotal,
      this.shippingTaxTotal,
      this.metaData});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$TaxLinesFromJson;

  Map<String, dynamic> toJson() => _$TaxLinesToJson(this);
}
