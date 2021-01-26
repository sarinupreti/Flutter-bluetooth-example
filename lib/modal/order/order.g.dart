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
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
      fields[13] as String,
      fields[14] as String,
      fields[15] as String,
      fields[16] as String,
      fields[17] as String,
      fields[18] as String,
      fields[19] as bool,
      fields[20] as int,
      fields[21] as String,
      fields[22] as String,
      fields[23] as String,
      fields[24] as Billing,
      fields[25] as Shipping,
      fields[26] as String,
      fields[27] as String,
      fields[28] as String,
      fields[29] as String,
      fields[30] as String,
      fields[31] as String,
      fields[32] as String,
      fields[33] as String,
      (fields[34] as List)?.cast<MetaDataType>(),
      (fields[35] as List)?.cast<LineItems>(),
      (fields[36] as List)?.cast<TaxLines>(),
      (fields[37] as List)?.cast<ShippingLines>(),
      (fields[38] as List)?.cast<OrderFeeLine>(),
      (fields[39] as List)?.cast<OrderCouponLine>(),
      (fields[40] as List)?.cast<Refunds>(),
      fields[41] as Links,
      fields[42] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(43)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parent_id)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.order_key)
      ..writeByte(4)
      ..write(obj.created_via)
      ..writeByte(5)
      ..write(obj.version)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.currency)
      ..writeByte(8)
      ..write(obj.date_created)
      ..writeByte(9)
      ..write(obj.date_created_gmt)
      ..writeByte(10)
      ..write(obj.date_modified)
      ..writeByte(11)
      ..write(obj.date_modified_gmt)
      ..writeByte(12)
      ..write(obj.discount_total)
      ..writeByte(13)
      ..write(obj.discount_tax)
      ..writeByte(14)
      ..write(obj.shipping_total)
      ..writeByte(15)
      ..write(obj.shipping_tax)
      ..writeByte(16)
      ..write(obj.cart_tax)
      ..writeByte(17)
      ..write(obj.total)
      ..writeByte(18)
      ..write(obj.total_tax)
      ..writeByte(19)
      ..write(obj.prices_include_tax)
      ..writeByte(20)
      ..write(obj.customer_id)
      ..writeByte(21)
      ..write(obj.customer_ip_address)
      ..writeByte(22)
      ..write(obj.customer_user_agent)
      ..writeByte(23)
      ..write(obj.customer_note)
      ..writeByte(24)
      ..write(obj.billing)
      ..writeByte(25)
      ..write(obj.shipping)
      ..writeByte(26)
      ..write(obj.payment_method)
      ..writeByte(27)
      ..write(obj.payment_method_title)
      ..writeByte(28)
      ..write(obj.transaction_id)
      ..writeByte(29)
      ..write(obj.date_paid)
      ..writeByte(30)
      ..write(obj.date_paid_gmt)
      ..writeByte(31)
      ..write(obj.date_completed)
      ..writeByte(32)
      ..write(obj.date_completed_gmt)
      ..writeByte(33)
      ..write(obj.cart_hash)
      ..writeByte(34)
      ..write(obj.meta_data)
      ..writeByte(35)
      ..write(obj.line_items)
      ..writeByte(36)
      ..write(obj.tax_lines)
      ..writeByte(37)
      ..write(obj.shipping_lines)
      ..writeByte(38)
      ..write(obj.fee_lines)
      ..writeByte(39)
      ..write(obj.couponLines)
      ..writeByte(40)
      ..write(obj.refunds)
      ..writeByte(41)
      ..write(obj.links)
      ..writeByte(42)
      ..write(obj.currency_symbol);
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
    json['id'] as int,
    json['parent_id'] as int,
    json['number'] as String,
    json['order_key'] as String,
    json['created_via'] as String,
    json['version'] as String,
    json['status'] as String,
    json['currency'] as String,
    json['date_created'] as String,
    json['date_created_gmt'] as String,
    json['date_modified'] as String,
    json['date_modified_gmt'] as String,
    json['discount_total'] as String,
    json['discount_tax'] as String,
    json['shipping_total'] as String,
    json['shipping_tax'] as String,
    json['cart_tax'] as String,
    json['total'] as String,
    json['total_tax'] as String,
    json['prices_include_tax'] as bool,
    json['customer_id'] as int,
    json['customer_ip_address'] as String,
    json['customer_user_agent'] as String,
    json['customer_note'] as String,
    json['billing'] == null
        ? null
        : Billing.fromJson(json['billing'] as Map<String, dynamic>),
    json['shipping'] == null
        ? null
        : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
    json['payment_method'] as String,
    json['payment_method_title'] as String,
    json['transaction_id'] as String,
    json['date_paid'] as String,
    json['date_paid_gmt'] as String,
    json['date_completed'] as String,
    json['date_completed_gmt'] as String,
    json['cart_hash'] as String,
    (json['meta_data'] as List)
        ?.map((e) =>
            e == null ? null : MetaDataType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['line_items'] as List)
        ?.map((e) =>
            e == null ? null : LineItems.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['tax_lines'] as List)
        ?.map((e) =>
            e == null ? null : TaxLines.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['shipping_lines'] as List)
        ?.map((e) => e == null
            ? null
            : ShippingLines.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['fee_lines'] as List)
        ?.map((e) =>
            e == null ? null : OrderFeeLine.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['couponLines'] as List)
        ?.map((e) => e == null
            ? null
            : OrderCouponLine.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['refunds'] as List)
        ?.map((e) =>
            e == null ? null : Refunds.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
    json['currency_symbol'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parent_id,
      'number': instance.number,
      'order_key': instance.order_key,
      'created_via': instance.created_via,
      'version': instance.version,
      'status': instance.status,
      'currency': instance.currency,
      'date_created': instance.date_created,
      'date_created_gmt': instance.date_created_gmt,
      'date_modified': instance.date_modified,
      'date_modified_gmt': instance.date_modified_gmt,
      'discount_total': instance.discount_total,
      'discount_tax': instance.discount_tax,
      'shipping_total': instance.shipping_total,
      'shipping_tax': instance.shipping_tax,
      'cart_tax': instance.cart_tax,
      'total': instance.total,
      'total_tax': instance.total_tax,
      'prices_include_tax': instance.prices_include_tax,
      'customer_id': instance.customer_id,
      'customer_ip_address': instance.customer_ip_address,
      'customer_user_agent': instance.customer_user_agent,
      'customer_note': instance.customer_note,
      'billing': instance.billing,
      'shipping': instance.shipping,
      'payment_method': instance.payment_method,
      'payment_method_title': instance.payment_method_title,
      'transaction_id': instance.transaction_id,
      'date_paid': instance.date_paid,
      'date_paid_gmt': instance.date_paid_gmt,
      'date_completed': instance.date_completed,
      'date_completed_gmt': instance.date_completed_gmt,
      'cart_hash': instance.cart_hash,
      'meta_data': instance.meta_data,
      'line_items': instance.line_items,
      'tax_lines': instance.tax_lines,
      'shipping_lines': instance.shipping_lines,
      'fee_lines': instance.fee_lines,
      'couponLines': instance.couponLines,
      'refunds': instance.refunds,
      'links': instance.links,
      'currency_symbol': instance.currency_symbol,
    };
