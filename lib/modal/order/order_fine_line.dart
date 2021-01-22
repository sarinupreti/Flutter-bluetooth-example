import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/order/order_fee_line_tax.dart';
import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'order_fine_line.g.dart';

@HiveType(typeId: HIVE_ORDER_FINE_LINE_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class OrderFeeLine extends HiveObject implements Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String taxClass;
  @HiveField(2)
  final String taxStatus;
  @HiveField(3)
  final String total;
  @HiveField(4)
  final String totalTax;
  @HiveField(5)
  final List<FeeLineTax> taxes;
  @HiveField(6)
  final List<MetaData> metaData;
  @HiveField(7)
  final int id;

  OrderFeeLine(this.id, this.name, this.taxClass, this.taxStatus, this.totalTax,
      this.taxes, this.metaData, this.total);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$OrderFeeLineFromJson;

  Map<String, dynamic> toJson() => _$OrderFeeLineToJson(this);
}
