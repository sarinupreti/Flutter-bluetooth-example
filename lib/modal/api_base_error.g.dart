// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_base_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_ApiBaseError _$_$_ApiBaseErrorFromJson(Map<String, dynamic> json) {
  return _$_ApiBaseError(
    data: json['data'] == null
        ? null
        : ErrorData.fromJson(json['data'] as Map<String, dynamic>),
    code: json['code'] as String,
    message: json['message'] as String,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_ApiBaseErrorToJson(_$_ApiBaseError instance) =>
    <String, dynamic>{
      'data': instance.data,
      'code': instance.code,
      'message': instance.message,
    };

// ignore: non_constant_identifier_names
_$_ErrorData _$_$_ErrorDataFromJson(Map<String, dynamic> json) {
  return _$_ErrorData(
    status: json['status'] as int,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_ErrorDataToJson(_$_ErrorData instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
