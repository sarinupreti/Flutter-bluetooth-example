import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: HIVE_USER_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class User extends HiveObject implements Equatable {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  bool emailVerified;
  @HiveField(3)
  List<WebsiteData> connectedWebsites;
  @HiveField(4)
  DateTime creationTime;
  @HiveField(5)
  DateTime lastSignInTime;

  @HiveField(6)
  String phoneNumber;

  @HiveField(7)
  String photoURL;

  @HiveField(8)
  List<String> providerType;

  @HiveField(9)
  String uId;

  User({
    this.name,
    this.email,
    this.emailVerified,
    this.connectedWebsites,
    this.creationTime,
    this.lastSignInTime,
    this.photoURL,
    this.providerType,
    this.uId,
    this.phoneNumber,
  });

  static const fromJson = _$UserFromJson;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  User copyWith({
    String name,
    String email,
    bool emailVerified,
    List<WebsiteData> connectedWebsites,
    DateTime creationTime,
    DateTime lastSignInTime,
    String phoneNumber,
    String photoURL,
    List<String> providerType,
    String uId,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      connectedWebsites: connectedWebsites ?? this.connectedWebsites,
      creationTime: creationTime ?? this.creationTime,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoURL: photoURL ?? this.photoURL,
      providerType: providerType ?? this.providerType,
      uId: uId ?? this.uId,
    );
  }
}
