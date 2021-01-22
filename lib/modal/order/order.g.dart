// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 15;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      id: fields[0] as int,
      parentId: fields[1] as int,
      number: fields[2] as String,
      orderKey: fields[3] as String,
      createdVia: fields[4] as String,
      version: fields[5] as String,
      status: fields[6] as String,
      currency: fields[7] as String,
      dateCreated: fields[8] as String,
      dateCreatedGmt: fields[9] as String,
      dateModified: fields[10] as String,
      dateModifiedGmt: fields[11] as String,
      discountTotal: fields[12] as String,
      discountTax: fields[13] as String,
      shippingTotal: fields[14] as String,
      shippingTax: fields[15] as String,
      cartTax: fields[16] as String,
      total: fields[17] as String,
      totalTax: fields[18] as String,
      pricesIncludeTax: fields[19] as bool,
      customerId: fields[20] as int,
      customerIpAddress: fields[21] as String,
      customerUserAgent: fields[22] as String,
      customerNote: fields[23] as String,
      billing: fields[24] as Billing,
      shipping: fields[25] as Shipping,
      paymentMethod: fields[26] as String,
      paymentMethodTitle: fields[27] as String,
      transactionId: fields[28] as String,
      datePaid: fields[29] as String,
      datePaidGmt: fields[30] as String,
      dateCompleted: fields[31] as String,
      dateCompletedGmt: fields[32] as String,
      cartHash: fields[33] as String,
      metaData: (fields[34] as List)?.cast<MetaDataType>(),
      lineItems: (fields[35] as List)?.cast<LineItems>(),
      taxLines: (fields[36] as List)?.cast<TaxLines>(),
      shippingLines: (fields[37] as List)?.cast<ShippingLines>(),
      feeLines: (fields[38] as List)?.cast<OrderFeeLine>(),
      couponLines: (fields[39] as List)?.cast<OrderCouponLine>(),
      refunds: (fields[40] as List)?.cast<Refunds>(),
      links: fields[41] as Links,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(42)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parentId)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.orderKey)
      ..writeByte(4)
      ..write(obj.createdVia)
      ..writeByte(5)
      ..write(obj.version)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.currency)
      ..writeByte(8)
      ..write(obj.dateCreated)
      ..writeByte(9)
      ..write(obj.dateCreatedGmt)
      ..writeByte(10)
      ..write(obj.dateModified)
      ..writeByte(11)
      ..write(obj.dateModifiedGmt)
      ..writeByte(12)
      ..write(obj.discountTotal)
      ..writeByte(13)
      ..write(obj.discountTax)
      ..writeByte(14)
      ..write(obj.shippingTotal)
      ..writeByte(15)
      ..write(obj.shippingTax)
      ..writeByte(16)
      ..write(obj.cartTax)
      ..writeByte(17)
      ..write(obj.total)
      ..writeByte(18)
      ..write(obj.totalTax)
      ..writeByte(19)
      ..write(obj.pricesIncludeTax)
      ..writeByte(20)
      ..write(obj.customerId)
      ..writeByte(21)
      ..write(obj.customerIpAddress)
      ..writeByte(22)
      ..write(obj.customerUserAgent)
      ..writeByte(23)
      ..write(obj.customerNote)
      ..writeByte(24)
      ..write(obj.billing)
      ..writeByte(25)
      ..write(obj.shipping)
      ..writeByte(26)
      ..write(obj.paymentMethod)
      ..writeByte(27)
      ..write(obj.paymentMethodTitle)
      ..writeByte(28)
      ..write(obj.transactionId)
      ..writeByte(29)
      ..write(obj.datePaid)
      ..writeByte(30)
      ..write(obj.datePaidGmt)
      ..writeByte(31)
      ..write(obj.dateCompleted)
      ..writeByte(32)
      ..write(obj.dateCompletedGmt)
      ..writeByte(33)
      ..write(obj.cartHash)
      ..writeByte(34)
      ..write(obj.metaData)
      ..writeByte(35)
      ..write(obj.lineItems)
      ..writeByte(36)
      ..write(obj.taxLines)
      ..writeByte(37)
      ..write(obj.shippingLines)
      ..writeByte(38)
      ..write(obj.feeLines)
      ..writeByte(39)
      ..write(obj.couponLines)
      ..writeByte(40)
      ..write(obj.refunds)
      ..writeByte(41)
      ..write(obj.links);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as int,
    parentId: json['parentId'] as int,
    number: json['number'] as String,
    orderKey: json['orderKey'] as String,
    createdVia: json['createdVia'] as String,
    version: json['version'] as String,
    status: json['status'] as String,
    currency: json['currency'] as String,
    dateCreated: json['dateCreated'] as String,
    dateCreatedGmt: json['dateCreatedGmt'] as String,
    dateModified: json['dateModified'] as String,
    dateModifiedGmt: json['dateModifiedGmt'] as String,
    discountTotal: json['discountTotal'] as String,
    discountTax: json['discountTax'] as String,
    shippingTotal: json['shippingTotal'] as String,
    shippingTax: json['shippingTax'] as String,
    cartTax: json['cartTax'] as String,
    total: json['total'] as String,
    totalTax: json['totalTax'] as String,
    pricesIncludeTax: json['pricesIncludeTax'] as bool,
    customerId: json['customerId'] as int,
    customerIpAddress: json['customerIpAddress'] as String,
    customerUserAgent: json['customerUserAgent'] as String,
    customerNote: json['customerNote'] as String,
    billing: json['billing'] == null
        ? null
        : Billing.fromJson(json['billing'] as Map<String, dynamic>),
    shipping: json['shipping'] == null
        ? null
        : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
    paymentMethod: json['paymentMethod'] as String,
    paymentMethodTitle: json['paymentMethodTitle'] as String,
    transactionId: json['transactionId'] as String,
    datePaid: json['datePaid'] as String,
    datePaidGmt: json['datePaidGmt'] as String,
    dateCompleted: json['dateCompleted'] as String,
    dateCompletedGmt: json['dateCompletedGmt'] as String,
    cartHash: json['cartHash'] as String,
    metaData: (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaDataType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lineItems: (json['lineItems'] as List)
        ?.map((e) =>
            e == null ? null : LineItems.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taxLines: (json['taxLines'] as List)
        ?.map((e) =>
            e == null ? null : TaxLines.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    shippingLines: (json['shippingLines'] as List)
        ?.map((e) => e == null
            ? null
            : ShippingLines.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    feeLines: (json['feeLines'] as List)
        ?.map((e) =>
            e == null ? null : OrderFeeLine.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    couponLines: (json['couponLines'] as List)
        ?.map((e) => e == null
            ? null
            : OrderCouponLine.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    refunds: (json['refunds'] as List)
        ?.map((e) =>
            e == null ? null : Refunds.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    links: json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'number': instance.number,
      'orderKey': instance.orderKey,
      'createdVia': instance.createdVia,
      'version': instance.version,
      'status': instance.status,
      'currency': instance.currency,
      'dateCreated': instance.dateCreated,
      'dateCreatedGmt': instance.dateCreatedGmt,
      'dateModified': instance.dateModified,
      'dateModifiedGmt': instance.dateModifiedGmt,
      'discountTotal': instance.discountTotal,
      'discountTax': instance.discountTax,
      'shippingTotal': instance.shippingTotal,
      'shippingTax': instance.shippingTax,
      'cartTax': instance.cartTax,
      'total': instance.total,
      'totalTax': instance.totalTax,
      'pricesIncludeTax': instance.pricesIncludeTax,
      'customerId': instance.customerId,
      'customerIpAddress': instance.customerIpAddress,
      'customerUserAgent': instance.customerUserAgent,
      'customerNote': instance.customerNote,
      'billing': instance.billing,
      'shipping': instance.shipping,
      'paymentMethod': instance.paymentMethod,
      'paymentMethodTitle': instance.paymentMethodTitle,
      'transactionId': instance.transactionId,
      'datePaid': instance.datePaid,
      'datePaidGmt': instance.datePaidGmt,
      'dateCompleted': instance.dateCompleted,
      'dateCompletedGmt': instance.dateCompletedGmt,
      'cartHash': instance.cartHash,
      'metaData': instance.metaData,
      'lineItems': instance.lineItems,
      'taxLines': instance.taxLines,
      'shippingLines': instance.shippingLines,
      'feeLines': instance.feeLines,
      'couponLines': instance.couponLines,
      'refunds': instance.refunds,
      'links': instance.links,
    };
