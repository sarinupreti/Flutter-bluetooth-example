// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductImageAdapter extends TypeAdapter<ProductImage> {
  @override
  final int typeId = 6;

  @override
  ProductImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductImage(
      id: fields[0] as int,
      src: fields[5] as String,
      name: fields[6] as String,
      alt: fields[7] as String,
      dateCreated: fields[1] as DateTime,
      dateCreatedGMT: fields[2] as DateTime,
      dateModified: fields[3] as DateTime,
      dateModifiedGMT: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProductImage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateCreated)
      ..writeByte(2)
      ..write(obj.dateCreatedGMT)
      ..writeByte(3)
      ..write(obj.dateModified)
      ..writeByte(4)
      ..write(obj.dateModifiedGMT)
      ..writeByte(5)
      ..write(obj.src)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.alt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) {
  return ProductImage(
    id: json['id'] as int,
    src: json['src'] as String,
    name: json['name'] as String,
    alt: json['alt'] as String,
    dateCreated: json['dateCreated'] == null
        ? null
        : DateTime.parse(json['dateCreated'] as String),
    dateCreatedGMT: json['dateCreatedGMT'] == null
        ? null
        : DateTime.parse(json['dateCreatedGMT'] as String),
    dateModified: json['dateModified'] == null
        ? null
        : DateTime.parse(json['dateModified'] as String),
    dateModifiedGMT: json['dateModifiedGMT'] == null
        ? null
        : DateTime.parse(json['dateModifiedGMT'] as String),
  );
}

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'dateCreatedGMT': instance.dateCreatedGMT?.toIso8601String(),
      'dateModified': instance.dateModified?.toIso8601String(),
      'dateModifiedGMT': instance.dateModifiedGMT?.toIso8601String(),
      'src': instance.src,
      'name': instance.name,
      'alt': instance.alt,
    };
