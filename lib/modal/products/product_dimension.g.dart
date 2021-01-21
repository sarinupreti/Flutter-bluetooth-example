// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dimension.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDimensionAdapter extends TypeAdapter<ProductDimension> {
  @override
  final int typeId = 3;

  @override
  ProductDimension read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDimension(
      length: fields[0] as String,
      height: fields[2] as String,
      width: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDimension obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.length)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDimensionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDimension _$ProductDimensionFromJson(Map<String, dynamic> json) {
  return ProductDimension(
    length: json['length'] as String,
    height: json['height'] as String,
    width: json['width'] as String,
  );
}

Map<String, dynamic> _$ProductDimensionToJson(ProductDimension instance) =>
    <String, dynamic>{
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };
