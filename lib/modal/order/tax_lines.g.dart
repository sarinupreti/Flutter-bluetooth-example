// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_lines.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaxLinesAdapter extends TypeAdapter<TaxLines> {
  @override
  final int typeId = 20;

  @override
  TaxLines read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaxLines(
      id: fields[0] as int,
      rate_code: fields[1] as String,
      rate_id: fields[2] as int,
      label: fields[3] as String,
      compound: fields[4] as bool,
      tax_total: fields[5] as String,
      shipping_tax_total: fields[6] as String,
      meta_data: (fields[7] as List)?.cast<MetaData>(),
      rate_percent: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TaxLines obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rate_code)
      ..writeByte(2)
      ..write(obj.rate_id)
      ..writeByte(3)
      ..write(obj.label)
      ..writeByte(4)
      ..write(obj.compound)
      ..writeByte(5)
      ..write(obj.tax_total)
      ..writeByte(6)
      ..write(obj.shipping_tax_total)
      ..writeByte(7)
      ..write(obj.meta_data)
      ..writeByte(8)
      ..write(obj.rate_percent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxLinesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxLines _$TaxLinesFromJson(Map<String, dynamic> json) {
  return TaxLines(
    id: json['id'] as int,
    rate_code: json['rate_code'] as String,
    rate_id: json['rate_id'] as int,
    label: json['label'] as String,
    compound: json['compound'] as bool,
    tax_total: json['tax_total'] as String,
    shipping_tax_total: json['shipping_tax_total'] as String,
    meta_data: (json['meta_data'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rate_percent: (json['rate_percent'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TaxLinesToJson(TaxLines instance) => <String, dynamic>{
      'id': instance.id,
      'rate_code': instance.rate_code,
      'rate_id': instance.rate_id,
      'label': instance.label,
      'compound': instance.compound,
      'tax_total': instance.tax_total,
      'shipping_tax_total': instance.shipping_tax_total,
      'meta_data': instance.meta_data,
      'rate_percent': instance.rate_percent,
    };
