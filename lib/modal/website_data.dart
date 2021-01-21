import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'website_data.g.dart';

@HiveType(typeId: HIVE_AUTH_BOX_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class WebsiteData extends HiveObject implements Equatable {
  @HiveField(0)
  String consumerKey;
  @HiveField(1)
  String consumerSecret;
  @HiveField(2)
  String websiteUrl;

  @HiveField(5)
  bool isLegacy;
  WebsiteData(
      {this.consumerKey,
      this.consumerSecret,
      this.websiteUrl,
      this.isLegacy = false});

  static const fromJson = _$WebsiteDataFromJson;

  Map<String, dynamic> toJson() => _$WebsiteDataToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WebsiteData &&
        o.consumerKey == consumerKey &&
        o.consumerSecret == consumerSecret &&
        o.websiteUrl == websiteUrl &&
        o.isLegacy == isLegacy;
  }

  @override
  int get hashCode {
    return consumerKey.hashCode ^
        consumerSecret.hashCode ^
        websiteUrl.hashCode ^
        isLegacy.hashCode;
  }
}
