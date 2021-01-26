// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_items.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LineItemsAdapter extends TypeAdapter<LineItems> {
  @override
  final int typeId = 16;

  @override
  LineItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LineItems(
      id: fields[0] as int,
      name: fields[1] as String,
      product_id: fields[2] as int,
      variation_id: fields[3] as int,
      quantity: fields[4] as int,
      tax_class: fields[5] as String,
      subtotal: fields[6] as String,
      subtotal_tax: fields[7] as String,
      total: fields[8] as String,
      total_tax: fields[9] as String,
      taxes: (fields[10] as List)?.cast<Taxes>(),
      meta_data: (fields[11] as List)?.cast<MetaData>(),
      sku: fields[12] as String,
      price: fields[13] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LineItems obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.product_id)
      ..writeByte(3)
      ..write(obj.variation_id)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.tax_class)
      ..writeByte(6)
      ..write(obj.subtotal)
      ..writeByte(7)
      ..write(obj.subtotal_tax)
      ..writeByte(8)
      ..write(obj.total)
      ..writeByte(9)
      ..write(obj.total_tax)
      ..writeByte(10)
      ..write(obj.taxes)
      ..writeByte(11)
      ..write(obj.meta_data)
      ..writeByte(12)
      ..write(obj.sku)
      ..writeByte(13)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LineItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineItems _$LineItemsFromJson(Map<String, dynamic> json) {
  return LineItems(
    id: json['id'] as int,
    name: json['name'] as String,
    product_id: json['product_id'] as int,
    variation_id: json['variation_id'] as int,
    quantity: json['quantity'] as int,
    tax_class: json['tax_class'] as String,
    subtotal: json['subtotal'] as String,
    subtotal_tax: json['subtotal_tax'] as String,
    total: json['total'] as String,
    total_tax: json['total_tax'] as String,
    taxes: (json['taxes'] as List)
        ?.map(
            (e) => e == null ? null : Taxes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    meta_data: (json['meta_data'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sku: json['sku'] as String,
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LineItemsToJson(LineItems instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_id': instance.product_id,
      'variation_id': instance.variation_id,
      'quantity': instance.quantity,
      'tax_class': instance.tax_class,
      'subtotal': instance.subtotal,
      'subtotal_tax': instance.subtotal_tax,
      'total': instance.total,
      'total_tax': instance.total_tax,
      'taxes': instance.taxes,
      'meta_data': instance.meta_data,
      'sku': instance.sku,
      'price': instance.price,
    };
