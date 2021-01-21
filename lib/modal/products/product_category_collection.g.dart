// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_collection.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategoryCollectionAdapter
    extends TypeAdapter<ProductCategoryCollection> {
  @override
  final int typeId = 13;

  @override
  ProductCategoryCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCategoryCollection();
  }

  @override
  void write(BinaryWriter writer, ProductCategoryCollection obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryCollection _$ProductCategoryCollectionFromJson(
    Map<String, dynamic> json) {
  return ProductCategoryCollection(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$ProductCategoryCollectionToJson(
        ProductCategoryCollection instance) =>
    <String, dynamic>{
      'href': instance.href,
    };
