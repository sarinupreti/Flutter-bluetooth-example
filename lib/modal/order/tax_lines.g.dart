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
      rateCode: fields[1] as String,
      rateId: fields[2] as int,
      label: fields[3] as String,
      compound: fields[4] as bool,
      taxTotal: fields[5] as String,
      shippingTaxTotal: fields[6] as String,
      metaData: (fields[7] as List)?.cast<MetaData>(),
    );
  }

  @override
  void write(BinaryWriter writer, TaxLines obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rateCode)
      ..writeByte(2)
      ..write(obj.rateId)
      ..writeByte(3)
      ..write(obj.label)
      ..writeByte(4)
      ..write(obj.compound)
      ..writeByte(5)
      ..write(obj.taxTotal)
      ..writeByte(6)
      ..write(obj.shippingTaxTotal)
      ..writeByte(7)
      ..write(obj.metaData);
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
    rateCode: json['rateCode'] as String,
    rateId: json['rateId'] as int,
    label: json['label'] as String,
    compound: json['compound'] as bool,
    taxTotal: json['taxTotal'] as String,
    shippingTaxTotal: json['shippingTaxTotal'] as String,
    metaData: (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TaxLinesToJson(TaxLines instance) => <String, dynamic>{
      'id': instance.id,
      'rateCode': instance.rateCode,
      'rateId': instance.rateId,
      'label': instance.label,
      'compound': instance.compound,
      'taxTotal': instance.taxTotal,
      'shippingTaxTotal': instance.shippingTaxTotal,
      'metaData': instance.metaData,
    };
