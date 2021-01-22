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
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      company: fields[2] as String,
      address1: fields[3] as String,
      address2: fields[4] as String,
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
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.company)
      ..writeByte(3)
      ..write(obj.address1)
      ..writeByte(4)
      ..write(obj.address2)
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
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    company: json['company'] as String,
    address1: json['address1'] as String,
    address2: json['address2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    postcode: json['postcode'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'company': instance.company,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
    };
