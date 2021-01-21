// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategoryLinksAdapter extends TypeAdapter<ProductCategoryLinks> {
  @override
  final int typeId = 11;

  @override
  ProductCategoryLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCategoryLinks();
  }

  @override
  void write(BinaryWriter writer, ProductCategoryLinks obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryLinks _$ProductCategoryLinksFromJson(Map<String, dynamic> json) {
  return ProductCategoryLinks(
    self: (json['self'] as List)
        ?.map((e) => e == null
            ? null
            : ProductCategorySelf.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    collection: (json['collection'] as List)
        ?.map((e) => e == null
            ? null
            : ProductCategoryCollection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductCategoryLinksToJson(
        ProductCategoryLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'collection': instance.collection,
    };
