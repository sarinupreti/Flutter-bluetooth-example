// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_default_attribute.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDefaultAttributeAdapter
    extends TypeAdapter<ProductDefaultAttribute> {
  @override
  final int typeId = 8;

  @override
  ProductDefaultAttribute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDefaultAttribute(
      id: fields[0] as int,
      name: fields[1] as String,
      option: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDefaultAttribute obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.option);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDefaultAttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDefaultAttribute _$ProductDefaultAttributeFromJson(
    Map<String, dynamic> json) {
  return ProductDefaultAttribute(
    id: json['id'] as int,
    name: json['name'] as String,
    option: json['option'] as String,
  );
}

Map<String, dynamic> _$ProductDefaultAttributeToJson(
        ProductDefaultAttribute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'option': instance.option,
    };
