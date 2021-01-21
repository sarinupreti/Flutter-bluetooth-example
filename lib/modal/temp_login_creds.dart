import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'temp_login_creds.g.dart';

@HiveType(typeId: HIVE_TEMP_CREDS_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class TempLoginCreds extends HiveObject implements Equatable {
  @HiveField(0)
  String consumerKey;
  @HiveField(1)
  String consumerSecret;
  @HiveField(2)
  String websiteUrl;
  @HiveField(3)
  String name;
  @HiveField(4)
  String email;
  @HiveField(5)
  bool isLegacy;
  TempLoginCreds(
      {this.consumerKey,
      this.consumerSecret,
      this.websiteUrl,
      this.name,
      this.email,
      this.isLegacy = false});

  static const fromJson = _$TempLoginCredsFromJson;

  Map<String, dynamic> toJson() => _$TempLoginCredsToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
