import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'api_base_error.freezed.dart';
part 'api_base_error.g.dart';

@freezed
abstract class ApiBaseError with _$ApiBaseError {
  factory ApiBaseError({
    ErrorData data,
    String code,
    String message,
  }) = _ApiBaseError;
  factory ApiBaseError.fromJson(Map<String, dynamic> json) => _$ApiBaseErrorFromJson(json);
}

@freezed
abstract class ErrorData with _$ErrorData {
  factory ErrorData({
    int status,
  }) = _ErrorData;
  factory ErrorData.fromJson(Map<String, dynamic> json) => _$ErrorDataFromJson(json);
}
