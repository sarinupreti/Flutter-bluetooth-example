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
  int product_id;
  @HiveField(3)
  int variation_id;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  String tax_class;
  @HiveField(6)
  String subtotal;
  @HiveField(7)
  String subtotal_tax;
  @HiveField(8)
  String total;
  @HiveField(9)
  String total_tax;
  @HiveField(10)
  List<Taxes> taxes;
  @HiveField(11)
  List<MetaData> meta_data;
  @HiveField(12)
  String sku;
  @HiveField(13)
  double price;

  LineItems(
      {this.id,
      this.name,
      this.product_id,
      this.variation_id,
      this.quantity,
      this.tax_class,
      this.subtotal,
      this.subtotal_tax,
      this.total,
      this.total_tax,
      this.taxes,
      this.meta_data,
      this.sku,
      this.price});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$LineItemsFromJson;

  Map<String, dynamic> toJson() => _$LineItemsToJson(this);
}
