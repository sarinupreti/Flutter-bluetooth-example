// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategoryAdapter extends TypeAdapter<ProductCategory> {
  @override
  final int typeId = 4;

  @override
  ProductCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCategory(
      id: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
      parent: fields[3] as int,
      description: fields[4] as String,
      display: fields[5] as String,
      image: fields[6] as ProductCategoryImage,
      menuOrder: fields[7] as int,
      count: fields[8] as int,
      links: fields[9] as ProductCategoryLinks,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCategory obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.parent)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.display)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.menuOrder)
      ..writeByte(8)
      ..write(obj.count)
      ..writeByte(9)
      ..write(obj.links);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) {
  return ProductCategory(
    id: json['id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String,
    parent: json['parent'] as int,
    description: json['description'] as String,
    display: json['display'] as String,
    image: json['image'] == null
        ? null
        : ProductCategoryImage.fromJson(json['image'] as Map<String, dynamic>),
    menuOrder: json['menuOrder'] as int,
    count: json['count'] as int,
    links: json['links'] == null
        ? null
        : ProductCategoryLinks.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'parent': instance.parent,
      'description': instance.description,
      'display': instance.display,
      'image': instance.image,
      'menuOrder': instance.menuOrder,
      'count': instance.count,
      'links': instance.links,
    };
