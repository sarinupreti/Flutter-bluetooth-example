// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillingAdapter extends TypeAdapter<Billing> {
  @override
  final int typeId = 16;

  @override
  Billing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Billing(
      first_name: fields[0] as String,
      last_name: fields[1] as String,
      company: fields[2] as String,
      address_1: fields[3] as String,
      address_2: fields[4] as String,
      city: fields[5] as String,
      state: fields[6] as String,
      postcode: fields[7] as String,
      country: fields[8] as String,
      email: fields[9] as String,
      phone: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Billing obj) {
    writer
      ..writeByte(11)
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
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Billing _$BillingFromJson(Map<String, dynamic> json) {
  return Billing(
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    company: json['company'] as String,
    address_1: json['address_1'] as String,
    address_2: json['address_2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    postcode: json['postcode'] as String,
    country: json['country'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$BillingToJson(Billing instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'company': instance.company,
      'address_1': instance.address_1,
      'address_2': instance.address_2,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'email': instance.email,
      'phone': instance.phone,
    };
