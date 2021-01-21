// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_attribute.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductItemAttributeAdapter extends TypeAdapter<ProductItemAttribute> {
  @override
  final int typeId = 7;

  @override
  ProductItemAttribute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductItemAttribute(
      id: fields[0] as int,
      name: fields[1] as String,
      position: fields[2] as int,
      visible: fields[3] as bool,
      variation: fields[4] as bool,
      options: (fields[5] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductItemAttribute obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.visible)
      ..writeByte(4)
      ..write(obj.variation)
      ..writeByte(5)
      ..write(obj.options);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductItemAttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItemAttribute _$ProductItemAttributeFromJson(Map<String, dynamic> json) {
  return ProductItemAttribute(
    id: json['id'] as int,
    name: json['name'] as String,
    position: json['position'] as int,
    visible: json['visible'] as bool,
    variation: json['variation'] as bool,
    options: (json['options'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ProductItemAttributeToJson(
        ProductItemAttribute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'visible': instance.visible,
      'variation': instance.variation,
      'options': instance.options,
    };
