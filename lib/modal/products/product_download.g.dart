// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_download.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDownloadAdapter extends TypeAdapter<ProductDownload> {
  @override
  final int typeId = 2;

  @override
  ProductDownload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDownload(
      id: fields[0] as String,
      name: fields[1] as String,
      file: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDownload obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.file);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDownloadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDownload _$ProductDownloadFromJson(Map<String, dynamic> json) {
  return ProductDownload(
    id: json['id'] as String,
    name: json['name'] as String,
    file: json['file'] as String,
  );
}

Map<String, dynamic> _$ProductDownloadToJson(ProductDownload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'file': instance.file,
    };
