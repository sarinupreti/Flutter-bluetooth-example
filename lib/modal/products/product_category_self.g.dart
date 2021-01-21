// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_self.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategorySelfAdapter extends TypeAdapter<ProductCategorySelf> {
  @override
  final int typeId = 12;

  @override
  ProductCategorySelf read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCategorySelf();
  }

  @override
  void write(BinaryWriter writer, ProductCategorySelf obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategorySelfAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategorySelf _$ProductCategorySelfFromJson(Map<String, dynamic> json) {
  return ProductCategorySelf(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$ProductCategorySelfToJson(
        ProductCategorySelf instance) =>
    <String, dynamic>{
      'href': instance.href,
    };
