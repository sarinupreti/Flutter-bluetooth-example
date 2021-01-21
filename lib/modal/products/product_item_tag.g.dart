// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_tag.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductItemTagAdapter extends TypeAdapter<ProductItemTag> {
  @override
  final int typeId = 5;

  @override
  ProductItemTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductItemTag(
      id: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductItemTag obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductItemTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItemTag _$ProductItemTagFromJson(Map<String, dynamic> json) {
  return ProductItemTag(
    id: json['id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String,
  );
}

Map<String, dynamic> _$ProductItemTagToJson(ProductItemTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
