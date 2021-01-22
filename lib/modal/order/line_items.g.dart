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
      productId: fields[2] as int,
      variationId: fields[3] as int,
      quantity: fields[4] as int,
      taxClass: fields[5] as String,
      subtotal: fields[6] as String,
      subtotalTax: fields[7] as String,
      total: fields[8] as String,
      totalTax: fields[9] as String,
      taxes: (fields[10] as List)?.cast<Taxes>(),
      metaData: (fields[11] as List)?.cast<MetaData>(),
      sku: fields[12] as String,
      price: fields[13] as String,
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
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.variationId)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.taxClass)
      ..writeByte(6)
      ..write(obj.subtotal)
      ..writeByte(7)
      ..write(obj.subtotalTax)
      ..writeByte(8)
      ..write(obj.total)
      ..writeByte(9)
      ..write(obj.totalTax)
      ..writeByte(10)
      ..write(obj.taxes)
      ..writeByte(11)
      ..write(obj.metaData)
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
    productId: json['productId'] as int,
    variationId: json['variationId'] as int,
    quantity: json['quantity'] as int,
    taxClass: json['taxClass'] as String,
    subtotal: json['subtotal'] as String,
    subtotalTax: json['subtotalTax'] as String,
    total: json['total'] as String,
    totalTax: json['totalTax'] as String,
    taxes: (json['taxes'] as List)
        ?.map(
            (e) => e == null ? null : Taxes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metaData: (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sku: json['sku'] as String,
    price: json['price'] as String,
  );
}

Map<String, dynamic> _$LineItemsToJson(LineItems instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'productId': instance.productId,
      'variationId': instance.variationId,
      'quantity': instance.quantity,
      'taxClass': instance.taxClass,
      'subtotal': instance.subtotal,
      'subtotalTax': instance.subtotalTax,
      'total': instance.total,
      'totalTax': instance.totalTax,
      'taxes': instance.taxes,
      'metaData': instance.metaData,
      'sku': instance.sku,
      'price': instance.price,
    };
