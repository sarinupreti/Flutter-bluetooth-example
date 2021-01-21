// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetaDataAdapter extends TypeAdapter<MetaData> {
  @override
  final int typeId = 9;

  @override
  MetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetaData(
      id: fields[0] as int,
      key: fields[1] as String,
      value: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MetaData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return MetaData(
    id: json['id'] as int,
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'value': instance.value,
    };
