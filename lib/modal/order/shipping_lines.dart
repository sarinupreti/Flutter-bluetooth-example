import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'shipping_lines.g.dart';

@HiveType(typeId: HIVE_SHIPPING_LINES_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class ShippingLines extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String methodTitle;
  @HiveField(2)
  String methodId;
  @HiveField(3)
  String total;
  @HiveField(4)
  String totalTax;
  @HiveField(5)
  List<Taxes> taxes;
  @HiveField(6)
  List<MetaData> metaData;

  ShippingLines(
      {this.id,
      this.methodTitle,
      this.methodId,
      this.total,
      this.totalTax,
      this.taxes,
      this.metaData});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool get stringify => throw UnimplementedError();
}
