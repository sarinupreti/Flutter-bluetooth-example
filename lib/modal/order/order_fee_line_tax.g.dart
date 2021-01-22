// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_fee_line_tax.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeeLineTaxAdapter extends TypeAdapter<FeeLineTax> {
  @override
  final int typeId = 16;

  @override
  FeeLineTax read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeeLineTax(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
      fields[5] as String,
      fields[6] as String,
      (fields[7] as List)?.cast<MetaDataType>(),
    );
  }

  @override
  void write(BinaryWriter writer, FeeLineTax obj) {
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
      other is FeeLineTaxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeeLineTax _$FeeLineTaxFromJson(Map<String, dynamic> json) {
  return FeeLineTax(
    json['id'] as int,
    json['rateCode'] as String,
    json['rateId'] as String,
    json['label'] as String,
    json['compound'] as bool,
    json['taxTotal'] as String,
    json['shippingTaxTotal'] as String,
    (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaDataType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FeeLineTaxToJson(FeeLineTax instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rateCode': instance.rateCode,
      'rateId': instance.rateId,
      'label': instance.label,
      'compound': instance.compound,
      'taxTotal': instance.taxTotal,
      'shippingTaxTotal': instance.shippingTaxTotal,
      'metaData': instance.metaData,
    };
