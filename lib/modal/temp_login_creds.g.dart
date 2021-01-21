// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_login_creds.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TempLoginCredsAdapter extends TypeAdapter<TempLoginCreds> {
  @override
  final int typeId = 14;

  @override
  TempLoginCreds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TempLoginCreds(
      consumerKey: fields[0] as String,
      consumerSecret: fields[1] as String,
      websiteUrl: fields[2] as String,
      name: fields[3] as String,
      email: fields[4] as String,
      isLegacy: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TempLoginCreds obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.consumerKey)
      ..writeByte(1)
      ..write(obj.consumerSecret)
      ..writeByte(2)
      ..write(obj.websiteUrl)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.isLegacy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempLoginCredsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempLoginCreds _$TempLoginCredsFromJson(Map<String, dynamic> json) {
  return TempLoginCreds(
    consumerKey: json['consumerKey'] as String,
    consumerSecret: json['consumerSecret'] as String,
    websiteUrl: json['websiteUrl'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    isLegacy: json['isLegacy'] as bool,
  );
}

Map<String, dynamic> _$TempLoginCredsToJson(TempLoginCreds instance) =>
    <String, dynamic>{
      'consumerKey': instance.consumerKey,
      'consumerSecret': instance.consumerSecret,
      'websiteUrl': instance.websiteUrl,
      'name': instance.name,
      'email': instance.email,
      'isLegacy': instance.isLegacy,
    };
