// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refunds.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RefundsAdapter extends TypeAdapter<Refunds> {
  @override
  final int typeId = 21;

  @override
  Refunds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Refunds(
      id: fields[0] as int,
      reason: fields[1] as String,
      total: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Refunds obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.reason)
      ..writeByte(2)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RefundsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refunds _$RefundsFromJson(Map<String, dynamic> json) {
  return Refunds(
    id: json['id'] as int,
    reason: json['reason'] as String,
    total: json['total'] as String,
  );
}

Map<String, dynamic> _$RefundsToJson(Refunds instance) => <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'total': instance.total,
    };
