// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_lines.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShippingLinesAdapter extends TypeAdapter<ShippingLines> {
  @override
  final int typeId = 26;

  @override
  ShippingLines read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShippingLines(
      id: fields[0] as int,
      methodTitle: fields[1] as String,
      methodId: fields[2] as String,
      total: fields[3] as String,
      totalTax: fields[4] as String,
      taxes: (fields[5] as List)?.cast<dynamic>(),
      metaData: (fields[6] as List)?.cast<MetaData>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShippingLines obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.methodTitle)
      ..writeByte(2)
      ..write(obj.methodId)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.totalTax)
      ..writeByte(5)
      ..write(obj.taxes)
      ..writeByte(6)
      ..write(obj.metaData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingLinesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingLines _$ShippingLinesFromJson(Map<String, dynamic> json) {
  return ShippingLines(
    id: json['id'] as int,
    methodTitle: json['methodTitle'] as String,
    methodId: json['methodId'] as String,
    total: json['total'] as String,
    totalTax: json['totalTax'] as String,
    taxes: json['taxes'] as List,
    metaData: (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ShippingLinesToJson(ShippingLines instance) =>
    <String, dynamic>{
      'id': instance.id,
      'methodTitle': instance.methodTitle,
      'methodId': instance.methodId,
      'total': instance.total,
      'totalTax': instance.totalTax,
      'taxes': instance.taxes,
      'metaData': instance.metaData,
    };
