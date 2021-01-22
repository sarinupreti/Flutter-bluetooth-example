// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_fine_line.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderFeeLineAdapter extends TypeAdapter<OrderFeeLine> {
  @override
  final int typeId = 16;

  @override
  OrderFeeLine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderFeeLine(
      fields[7] as int,
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[4] as String,
      (fields[5] as List)?.cast<FeeLineTax>(),
      (fields[6] as List)?.cast<MetaData>(),
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderFeeLine obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.taxClass)
      ..writeByte(2)
      ..write(obj.taxStatus)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.totalTax)
      ..writeByte(5)
      ..write(obj.taxes)
      ..writeByte(6)
      ..write(obj.metaData)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderFeeLineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderFeeLine _$OrderFeeLineFromJson(Map<String, dynamic> json) {
  return OrderFeeLine(
    json['id'] as int,
    json['name'] as String,
    json['taxClass'] as String,
    json['taxStatus'] as String,
    json['totalTax'] as String,
    (json['taxes'] as List)
        ?.map((e) =>
            e == null ? null : FeeLineTax.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total'] as String,
  );
}

Map<String, dynamic> _$OrderFeeLineToJson(OrderFeeLine instance) =>
    <String, dynamic>{
      'name': instance.name,
      'taxClass': instance.taxClass,
      'taxStatus': instance.taxStatus,
      'total': instance.total,
      'totalTax': instance.totalTax,
      'taxes': instance.taxes,
      'metaData': instance.metaData,
      'id': instance.id,
    };
