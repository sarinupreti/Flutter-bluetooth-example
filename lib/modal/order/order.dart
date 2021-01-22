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
  final int parentId;
  @HiveField(2)
  final String number;
  @HiveField(3)
  final String orderKey;
  @HiveField(4)
  final String createdVia;
  @HiveField(5)
  final String version;
  @HiveField(6)
  final String status;
  @HiveField(7)
  final String currency;
  @HiveField(8)
  final String dateCreated;
  @HiveField(9)
  final String dateCreatedGmt;
  @HiveField(10)
  final String dateModified;
  @HiveField(11)
  final String dateModifiedGmt;
  @HiveField(12)
  final String discountTotal;
  @HiveField(13)
  final String discountTax;
  @HiveField(14)
  final String shippingTotal;
  @HiveField(15)
  final String shippingTax;
  @HiveField(16)
  final String cartTax;
  @HiveField(17)
  final String total;
  @HiveField(18)
  final String totalTax;
  @HiveField(19)
  final bool pricesIncludeTax;
  @HiveField(20)
  final int customerId;
  @HiveField(21)
  final String customerIpAddress;
  @HiveField(22)
  final String customerUserAgent;
  @HiveField(23)
  final String customerNote;
  @HiveField(24)
  final Billing billing;
  @HiveField(25)
  final Shipping shipping;
  @HiveField(26)
  final String paymentMethod;
  @HiveField(27)
  final String paymentMethodTitle;
  @HiveField(28)
  final String transactionId;
  @HiveField(29)
  final String datePaid;
  @HiveField(30)
  final String datePaidGmt;
  @HiveField(31)
  final String dateCompleted;
  @HiveField(32)
  final String dateCompletedGmt;
  @HiveField(33)
  final String cartHash;
  @HiveField(34)
  final List<MetaDataType> metaData;
  @HiveField(35)
  final List<LineItems> lineItems;
  @HiveField(36)
  final List<TaxLines> taxLines;
  @HiveField(37)
  final List<ShippingLines> shippingLines;
  @HiveField(38)
  final List<OrderFeeLine> feeLines;
  @HiveField(39)
  final List<OrderCouponLine> couponLines;
  @HiveField(40)
  final List<Refunds> refunds;
  @HiveField(41)
  final Links links;

  Order(
      {@required this.id,
      this.parentId,
      this.number,
      this.orderKey,
      this.createdVia,
      this.version,
      this.status,
      this.currency,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.discountTotal,
      this.discountTax,
      this.shippingTotal,
      this.shippingTax,
      this.cartTax,
      this.total,
      this.totalTax,
      this.pricesIncludeTax,
      this.customerId,
      this.customerIpAddress,
      this.customerUserAgent,
      this.customerNote,
      this.billing,
      this.shipping,
      this.paymentMethod,
      this.paymentMethodTitle,
      this.transactionId,
      this.datePaid,
      this.datePaidGmt,
      this.dateCompleted,
      this.dateCompletedGmt,
      this.cartHash,
      this.metaData,
      this.lineItems,
      this.taxLines,
      this.shippingLines,
      this.feeLines,
      this.couponLines,
      this.refunds,
      this.links})
      : assert(id != null);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  static const fromJson = _$OrderFromJson;

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
