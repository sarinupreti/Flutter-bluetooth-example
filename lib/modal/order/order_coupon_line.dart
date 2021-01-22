import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'order_coupon_line.g.dart';

@HiveType(typeId: HIVE_ORDER_COUPON_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class OrderCouponLine extends HiveObject implements Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String code;
  @HiveField(2)
  String discount;
  @HiveField(3)
  String discountTax;
  @HiveField(4)
  List<MetaData> metaData;

  OrderCouponLine(
      this.id, this.code, this.discount, this.discountTax, this.metaData);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool get stringify => throw UnimplementedError();
}
