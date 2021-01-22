import 'package:bell_delivery_hub/modal/order/taxes.dart';
import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';
import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'line_items.g.dart';

@HiveType(typeId: HIVE_ORDER_FINE_LINE_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class LineItems extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int productId;
  @HiveField(3)
  int variationId;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  String taxClass;
  @HiveField(6)
  String subtotal;
  @HiveField(7)
  String subtotalTax;
  @HiveField(8)
  String total;
  @HiveField(9)
  String totalTax;
  @HiveField(10)
  List<Taxes> taxes;
  @HiveField(11)
  List<MetaData> metaData;
  @HiveField(12)
  String sku;
  @HiveField(13)
  String price;

  LineItems(
      {this.id,
      this.name,
      this.productId,
      this.variationId,
      this.quantity,
      this.taxClass,
      this.subtotal,
      this.subtotalTax,
      this.total,
      this.totalTax,
      this.taxes,
      this.metaData,
      this.sku,
      this.price});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$LineItemsFromJson;

  Map<String, dynamic> toJson() => _$LineItemsToJson(this);
}
