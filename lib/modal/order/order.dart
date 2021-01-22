// import 'package:bell_delivery_hub/data/hive/hive_const.dart';
// import 'package:bell_delivery_hub/modal/order/order_coupon_line.dart';
// import 'package:bell_delivery_hub/modal/order/order_fine_line.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';

// part 'order.g.dart';

// @HiveType(typeId: HIVE_ORDER_BOX_TYPE_ID)
// // ignore: must_be_immutable
// class Order extends HiveObject implements Equatable {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final int parentId;
//   @HiveField(2)
//   final String number;
//   @HiveField(3)
//   final String orderKey;
//   @HiveField(4)
//   final String createdVia;
//   @HiveField(5)
//   final String version;
//   @HiveField(6)
//   final String status;
//   @HiveField(7)
//   final String currency;
//   @HiveField(8)
//   final String dateCreated;
//   @HiveField(9)
//   final String dateCreatedGmt;
//   @HiveField(10)
//   final String dateModified;
//   @HiveField(11)
//   final String dateModifiedGmt;
//   @HiveField(12)
//   final String discountTotal;
//   @HiveField(13)
//   final String discountTax;
//   @HiveField(14)
//   final String shippingTotal;
//   @HiveField(15)
//   final String shippingTax;
//   @HiveField(16)
//   final String cartTax;
//   @HiveField(17)
//   final String total;
//   @HiveField(18)
//   final String totalTax;
//   @HiveField(19)
//   final bool pricesIncludeTax;
//   @HiveField(20)
//   final int customerId;
//   @HiveField(21)
//   final String customerIpAddress;
//   @HiveField(22)
//   final String customerUserAgent;
//   @HiveField(23)
//   final String customerNote;
//   @HiveField(24)
//   final Billing billing;
//   @HiveField(25)
//   final Shipping shipping;
//   @HiveField(26)
//   final String paymentMethod;
//   @HiveField(27)
//   final String paymentMethodTitle;
//   @HiveField(28)
//   final String transactionId;
//   @HiveField(29)
//   final String datePaid;
//   @HiveField(30)
//   final String datePaidGmt;
//   @HiveField(31)
//   final String dateCompleted;
//   @HiveField(32)
//   final String dateCompletedGmt;
//   @HiveField(33)
//   final String cartHash;
//   @HiveField(34)
//   final List<MetaData> metaData;
//   @HiveField(35)
//   final List<LineItems> lineItems;
//   @HiveField(36)
//   final List<TaxLines> taxLines;
//   @HiveField(37)
//   final List<ShippingLines> shippingLines;
//   @HiveField(38)
//   final List<OrderFeeLine> feeLines;
//   @HiveField(39)
//   final List<OrderCouponLine> couponLines;
//   @HiveField(40)
//   final List<Refunds> refunds;
//   @HiveField(41)
//   final Links links;

//   Order(
//       {@required this.id,
//       this.parentId,
//       this.number,
//       this.orderKey,
//       this.createdVia,
//       this.version,
//       this.status,
//       this.currency,
//       this.dateCreated,
//       this.dateCreatedGmt,
//       this.dateModified,
//       this.dateModifiedGmt,
//       this.discountTotal,
//       this.discountTax,
//       this.shippingTotal,
//       this.shippingTax,
//       this.cartTax,
//       this.total,
//       this.totalTax,
//       this.pricesIncludeTax,
//       this.customerId,
//       this.customerIpAddress,
//       this.customerUserAgent,
//       this.customerNote,
//       this.billing,
//       this.shipping,
//       this.paymentMethod,
//       this.paymentMethodTitle,
//       this.transactionId,
//       this.datePaid,
//       this.datePaidGmt,
//       this.dateCompleted,
//       this.dateCompletedGmt,
//       this.cartHash,
//       this.metaData,
//       this.lineItems,
//       this.taxLines,
//       this.shippingLines,
//       this.feeLines,
//       this.couponLines,
//       this.refunds,
//       this.links})
//       : assert(id != null);

//   @override
//   // TODO: implement props
//   List<Object> get props => throw UnimplementedError();

//   @override
//   // TODO: implement stringify
//   bool get stringify => throw UnimplementedError();
// }

// class LineItems {
//   int id;
//   String name;
//   int productId;
//   int variationId;
//   int quantity;
//   String taxClass;
//   String subtotal;
//   String subtotalTax;
//   String total;
//   String totalTax;
//   List<Taxes> taxes;
//   List<MetaData> metaData;
//   String sku;
//   String price;

//   LineItems(
//       {this.id,
//       this.name,
//       this.productId,
//       this.variationId,
//       this.quantity,
//       this.taxClass,
//       this.subtotal,
//       this.subtotalTax,
//       this.total,
//       this.totalTax,
//       this.taxes,
//       this.metaData,
//       this.sku,
//       this.price});

//   LineItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     productId = json['product_id'];
//     variationId = json['variation_id'];
//     quantity = json['quantity'];
//     taxClass = json['tax_class'];
//     subtotal = json['subtotal'];
//     subtotalTax = json['subtotal_tax'];
//     total = json['total'];
//     totalTax = json['total_tax'];
//     taxes = (json['taxes'] as List).map((i) => Taxes.fromJson(i)).toList();
//     metaData =
//         (json['meta_data'] as List).map((i) => MetaData.fromJson(i)).toList();
//     sku = json['sku'];
//     price = json['price'].toString();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['product_id'] = this.productId;
//     data['variation_id'] = this.variationId;
//     data['quantity'] = this.quantity;
//     data['tax_class'] = this.taxClass;
//     data['subtotal'] = this.subtotal;
//     data['subtotal_tax'] = this.subtotalTax;
//     data['total'] = this.total;
//     data['total_tax'] = this.totalTax;
//     if (this.taxes != null) {
//       data['taxes'] = this.taxes.map((v) => v.toJson()).toList();
//     }
//     if (this.metaData != null) {
//       data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
//     }
//     data['sku'] = this.sku;
//     data['price'] = this.price;
//     return data;
//   }

//   @override
//   toString() => this.toJson().toString();
// }

// class Taxes {
//   int id;
//   String total;
//   String subtotal;

//   Taxes({this.id, this.total, this.subtotal});

//   Taxes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     total = json['total'];
//     subtotal = json['subtotal'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['total'] = this.total;
//     data['subtotal'] = this.subtotal;
//     return data;
//   }
// }

// class TaxLines {
//   int id;
//   String rateCode;
//   int rateId;
//   String label;
//   bool compound;
//   String taxTotal;
//   String shippingTaxTotal;
//   List<MetaData> metaData;

//   TaxLines(
//       {this.id,
//       this.rateCode,
//       this.rateId,
//       this.label,
//       this.compound,
//       this.taxTotal,
//       this.shippingTaxTotal,
//       this.metaData});

//   TaxLines.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     rateCode = json['rate_code'];
//     rateId = json['rate_id'];
//     label = json['label'];
//     compound = json['compound'];
//     taxTotal = json['tax_total'];
//     shippingTaxTotal = json['shipping_tax_total'];
//     metaData =
//         (json['meta_data'] as List).map((i) => MetaData.fromJson(i)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['rate_code'] = this.rateCode;
//     data['rate_id'] = this.rateId;
//     data['label'] = this.label;
//     data['compound'] = this.compound;
//     data['tax_total'] = this.taxTotal;
//     data['shipping_tax_total'] = this.shippingTaxTotal;
//     if (this.metaData != null) {
//       data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ShippingLines {
//   int id;
//   String methodTitle;
//   String methodId;
//   String total;
//   String totalTax;
//   List<Taxes> taxes;
//   List<MetaData> metaData;

//   ShippingLines(
//       {this.id,
//       this.methodTitle,
//       this.methodId,
//       this.total,
//       this.totalTax,
//       this.taxes,
//       this.metaData});

//   ShippingLines.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     methodTitle = json['method_title'];
//     methodId = json['method_id'];
//     total = json['total'];
//     totalTax = json['total_tax'];

//     taxes = (json['taxes'] as List).map((i) => Taxes.fromJson(i)).toList();
//     metaData =
//         (json['meta_data'] as List).map((i) => MetaData.fromJson(i)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['method_title'] = this.methodTitle;
//     data['method_id'] = this.methodId;
//     data['total'] = this.total;
//     data['total_tax'] = this.totalTax;
//     if (this.taxes != null) {
//       data['taxes'] = this.taxes.map((v) => v.toJson()).toList();
//     }
//     if (this.metaData != null) {
//       data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Links {
//   List<Self> self;
//   List<Collection> collection;

//   Links({this.self, this.collection});

//   Links.fromJson(Map<String, dynamic> json) {
//     if (json['self'] != null) {
//       self = new List<Self>();
//       json['self'].forEach((v) {
//         self.add(new Self.fromJson(v));
//       });
//     }
//     if (json['collection'] != null) {
//       collection = new List<Collection>();
//       json['collection'].forEach((v) {
//         collection.add(new Collection.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self.map((v) => v.toJson()).toList();
//     }
//     if (this.collection != null) {
//       data['collection'] = this.collection.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
