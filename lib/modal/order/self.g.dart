// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelfAdapter extends TypeAdapter<Self> {
  @override
  final int typeId = 24;

  @override
  Self read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Self(
      href: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Self obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.href);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelfAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Self _$SelfFromJson(Map<String, dynamic> json) {
  return Self(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$SelfToJson(Self instance) => <String, dynamic>{
      'href': instance.href,
    };
