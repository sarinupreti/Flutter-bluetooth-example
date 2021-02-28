import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  final String status;
  final String token;
  final Map<String, dynamic> data;

  BaseResponse({
    this.status,
    this.token,
    this.data,
  });

  static const fromJson = _$BaseResponseFromJson;

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
