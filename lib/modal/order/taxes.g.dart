// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaxesAdapter extends TypeAdapter<Taxes> {
  @override
  final int typeId = 28;

  @override
  Taxes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Taxes(
      id: fields[0] as int,
      total: fields[1] as String,
      subtotal: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Taxes obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.total)
      ..writeByte(2)
      ..write(obj.subtotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Taxes _$TaxesFromJson(Map<String, dynamic> json) {
  return Taxes(
    id: json['id'] as int,
    total: json['total'] as String,
    subtotal: json['subtotal'] as String,
  );
}

Map<String, dynamic> _$TaxesToJson(Taxes instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'subtotal': instance.subtotal,
    };
