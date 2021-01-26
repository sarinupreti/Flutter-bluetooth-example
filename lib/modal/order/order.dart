import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/order/billing.dart';
import 'package:bell_delivery_hub/modal/order/line_items.dart';
import 'package:bell_delivery_hub/modal/order/links.dart';
import 'package:bell_delivery_hub/modal/order/meta.dart';
import 'package:bell_delivery_hub/modal/order/order_coupon_line.dart';
import 'package:bell_delivery_hub/modal/order/order_fine_line.dart';
import 'package:bell_delivery_hub/modal/order/refunds.dart';
import 'package:bell_delivery_hub/modal/order/shipping.dart';
import 'package:bell_delivery_hub/modal/order/shipping_lines.dart';
import 'package:bell_delivery_hub/modal/order/tax_lines.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'order.g.dart';

@HiveType(typeId: HIVE_ORDER_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Order extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int parent_id;
  @HiveField(2)
  final String number;
  @HiveField(3)
  final String order_key;
  @HiveField(4)
  final String created_via;
  @HiveField(5)
  final String version;
  @HiveField(6)
  final String status;
  @HiveField(7)
  final String currency;
  @HiveField(8)
  final String date_created;
  @HiveField(9)
  final String date_created_gmt;
  @HiveField(10)
  final String date_modified;
  @HiveField(11)
  final String date_modified_gmt;
  @HiveField(12)
  final String discount_total;
  @HiveField(13)
  final String discount_tax;
  @HiveField(14)
  final String shipping_total;
  @HiveField(15)
  final String shipping_tax;
  @HiveField(16)
  final String cart_tax;
  @HiveField(17)
  final String total;
  @HiveField(18)
  final String total_tax;
  @HiveField(19)
  final bool prices_include_tax;
  @HiveField(20)
  final int customer_id;
  @HiveField(21)
  final String customer_ip_address;
  @HiveField(22)
  final String customer_user_agent;
  @HiveField(23)
  final String customer_note;
  @HiveField(24)
  final Billing billing;
  @HiveField(25)
  final Shipping shipping;
  @HiveField(26)
  final String payment_method;
  @HiveField(27)
  final String payment_method_title;
  @HiveField(28)
  final String transaction_id;
  @HiveField(29)
  final String date_paid;
  @HiveField(30)
  final String date_paid_gmt;
  @HiveField(31)
  final String date_completed;
  @HiveField(32)
  final String date_completed_gmt;
  @HiveField(33)
  final String cart_hash;
  @HiveField(34)
  final List<MetaDataType> meta_data;
  @HiveField(35)
  final List<LineItems> line_items;
  @HiveField(36)
  final List<TaxLines> tax_lines;
  @HiveField(37)
  final List<ShippingLines> shipping_lines;
  @HiveField(38)
  final List<OrderFeeLine> fee_lines;
  @HiveField(39)
  final List<OrderCouponLine> couponLines;
  @HiveField(40)
  final List<Refunds> refunds;
  @HiveField(41)
  final Links links;
  @HiveField(42)
  final String currency_symbol;

  Order(
      this.id,
      this.parent_id,
      this.number,
      this.order_key,
      this.created_via,
      this.version,
      this.status,
      this.currency,
      this.date_created,
      this.date_created_gmt,
      this.date_modified,
      this.date_modified_gmt,
      this.discount_total,
      this.discount_tax,
      this.shipping_total,
      this.shipping_tax,
      this.cart_tax,
      this.total,
      this.total_tax,
      this.prices_include_tax,
      this.customer_id,
      this.customer_ip_address,
      this.customer_user_agent,
      this.customer_note,
      this.billing,
      this.shipping,
      this.payment_method,
      this.payment_method_title,
      this.transaction_id,
      this.date_paid,
      this.date_paid_gmt,
      this.date_completed,
      this.date_completed_gmt,
      this.cart_hash,
      this.meta_data,
      this.line_items,
      this.tax_lines,
      this.shipping_lines,
      this.fee_lines,
      this.couponLines,
      this.refunds,
      this.links,
      this.currency_symbol)
      : assert(id != null);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$OrderFromJson;

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
