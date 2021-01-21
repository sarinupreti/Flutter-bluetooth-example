// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WebsiteDataAdapter extends TypeAdapter<WebsiteData> {
  @override
  final int typeId = 0;

  @override
  WebsiteData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WebsiteData(
      consumerKey: fields[0] as String,
      consumerSecret: fields[1] as String,
      websiteUrl: fields[2] as String,
      isLegacy: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WebsiteData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.consumerKey)
      ..writeByte(1)
      ..write(obj.consumerSecret)
      ..writeByte(2)
      ..write(obj.websiteUrl)
      ..writeByte(5)
      ..write(obj.isLegacy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebsiteDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsiteData _$WebsiteDataFromJson(Map<String, dynamic> json) {
  return WebsiteData(
    consumerKey: json['consumerKey'] as String,
    consumerSecret: json['consumerSecret'] as String,
    websiteUrl: json['websiteUrl'] as String,
    isLegacy: json['isLegacy'] as bool,
  );
}

Map<String, dynamic> _$WebsiteDataToJson(WebsiteData instance) =>
    <String, dynamic>{
      'consumerKey': instance.consumerKey,
      'consumerSecret': instance.consumerSecret,
      'websiteUrl': instance.websiteUrl,
      'isLegacy': instance.isLegacy,
    };
