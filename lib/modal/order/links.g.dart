// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinksAdapter extends TypeAdapter<Links> {
  @override
  final int typeId = 25;

  @override
  Links read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Links(
      self: (fields[0] as List)?.cast<Self>(),
      collection: (fields[1] as List)?.cast<Collection>(),
    );
  }

  @override
  void write(BinaryWriter writer, Links obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.self)
      ..writeByte(1)
      ..write(obj.collection);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    self: (json['self'] as List)
        ?.map(
            (e) => e == null ? null : Self.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    collection: (json['collection'] as List)
        ?.map((e) =>
            e == null ? null : Collection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'collection': instance.collection,
    };
