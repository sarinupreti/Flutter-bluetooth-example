// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShippingAdapter extends TypeAdapter<Shipping> {
  @override
  final int typeId = 20;

  @override
  Shipping read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shipping(
      first_name: fields[0] as String,
      last_name: fields[1] as String,
      company: fields[2] as String,
      address_1: fields[3] as String,
      address_2: fields[4] as String,
      city: fields[5] as String,
      state: fields[6] as String,
      postcode: fields[7] as String,
      country: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Shipping obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.first_name)
      ..writeByte(1)
      ..write(obj.last_name)
      ..writeByte(2)
      ..write(obj.company)
      ..writeByte(3)
      ..write(obj.address_1)
      ..writeByte(4)
      ..write(obj.address_2)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.state)
      ..writeByte(7)
      ..write(obj.postcode)
      ..writeByte(8)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipping _$ShippingFromJson(Map<String, dynamic> json) {
  return Shipping(
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    company: json['company'] as String,
    address_1: json['address_1'] as String,
    address_2: json['address_2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    postcode: json['postcode'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'company': instance.company,
      'address_1': instance.address_1,
      'address_2': instance.address_2,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
    };
