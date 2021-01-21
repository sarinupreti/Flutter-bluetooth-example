// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategoryImageAdapter extends TypeAdapter<ProductCategoryImage> {
  @override
  final int typeId = 10;

  @override
  ProductCategoryImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCategoryImage();
  }

  @override
  void write(BinaryWriter writer, ProductCategoryImage obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryImage _$ProductCategoryImageFromJson(Map<String, dynamic> json) {
  return ProductCategoryImage(
    id: json['id'] as int,
    dateCreated: json['dateCreated'] as String,
    dateCreatedGmt: json['dateCreatedGmt'] as String,
    dateModified: json['dateModified'] as String,
    dateModifiedGmt: json['dateModifiedGmt'] as String,
    src: json['src'] as String,
    name: json['name'] as String,
    alt: json['alt'] as String,
  );
}

Map<String, dynamic> _$ProductCategoryImageToJson(
        ProductCategoryImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateCreated': instance.dateCreated,
      'dateCreatedGmt': instance.dateCreatedGmt,
      'dateModified': instance.dateModified,
      'dateModifiedGmt': instance.dateModifiedGmt,
      'src': instance.src,
      'name': instance.name,
      'alt': instance.alt,
    };
