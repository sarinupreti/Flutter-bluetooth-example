import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:bell_delivery_hub/data/hive/hive_const.dart';

part 'user.g.dart';

@HiveType(typeId: HIVE_USER_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class User extends HiveObject implements Equatable {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String createdAt;
  @HiveField(4)
  String updatedAt;
  @HiveField(5)
  String token;

  User({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  static const fromJson = _$UserFromJson;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  User copyWith({
    String id,
    String name,
    String email,
    String createdAt,
    String updatedAt,
    String token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      token: token ?? this.token,
    );
  }
}
