// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 100;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String,
      email: fields[1] as String,
      emailVerified: fields[2] as bool,
      connectedWebsites: (fields[3] as List)?.cast<WebsiteData>(),
      creationTime: fields[4] as DateTime,
      lastSignInTime: fields[5] as DateTime,
      photoURL: fields[7] as String,
      providerType: (fields[8] as List)?.cast<String>(),
      uId: fields[9] as String,
      phoneNumber: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.emailVerified)
      ..writeByte(3)
      ..write(obj.connectedWebsites)
      ..writeByte(4)
      ..write(obj.creationTime)
      ..writeByte(5)
      ..write(obj.lastSignInTime)
      ..writeByte(6)
      ..write(obj.phoneNumber)
      ..writeByte(7)
      ..write(obj.photoURL)
      ..writeByte(8)
      ..write(obj.providerType)
      ..writeByte(9)
      ..write(obj.uId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    email: json['email'] as String,
    emailVerified: json['emailVerified'] as bool,
    connectedWebsites: (json['connectedWebsites'] as List)
        ?.map((e) =>
            e == null ? null : WebsiteData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creationTime: json['creationTime'] == null
        ? null
        : DateTime.parse(json['creationTime'] as String),
    lastSignInTime: json['lastSignInTime'] == null
        ? null
        : DateTime.parse(json['lastSignInTime'] as String),
    photoURL: json['photoURL'] as String,
    providerType:
        (json['providerType'] as List)?.map((e) => e as String)?.toList(),
    uId: json['uId'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'connectedWebsites': instance.connectedWebsites,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastSignInTime': instance.lastSignInTime?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoURL,
      'providerType': instance.providerType,
      'uId': instance.uId,
    };
