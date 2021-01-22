import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: HIVE_ORDER_FINE_LINE_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class FeeLineTax extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String rateCode;
  @HiveField(2)
  String rateId;
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

  FeeLineTax(this.id, this.rateCode, this.rateId, this.label, this.compound,
      this.taxTotal, this.shippingTaxTotal, this.metaData);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
