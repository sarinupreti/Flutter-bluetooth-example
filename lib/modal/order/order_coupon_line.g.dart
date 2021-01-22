// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_coupon_line.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderCouponLineAdapter extends TypeAdapter<OrderCouponLine> {
  @override
  final int typeId = 17;

  @override
  OrderCouponLine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderCouponLine(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      (fields[4] as List)?.cast<MetaData>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderCouponLine obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.discount)
      ..writeByte(3)
      ..write(obj.discountTax)
      ..writeByte(4)
      ..write(obj.metaData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderCouponLineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCouponLine _$OrderCouponLineFromJson(Map<String, dynamic> json) {
  return OrderCouponLine(
    json['id'] as int,
    json['code'] as String,
    json['discount'] as String,
    json['discountTax'] as String,
    (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderCouponLineToJson(OrderCouponLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'discount': instance.discount,
      'discountTax': instance.discountTax,
      'metaData': instance.metaData,
    };
