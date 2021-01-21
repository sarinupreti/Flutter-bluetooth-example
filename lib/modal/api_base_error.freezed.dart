// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'api_base_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ApiBaseError _$ApiBaseErrorFromJson(Map<String, dynamic> json) {
  return _ApiBaseError.fromJson(json);
}

/// @nodoc
class _$ApiBaseErrorTearOff {
  const _$ApiBaseErrorTearOff();

// ignore: unused_element
  _ApiBaseError call({ErrorData data, String code, String message}) {
    return _ApiBaseError(
      data: data,
      code: code,
      message: message,
    );
  }

// ignore: unused_element
  ApiBaseError fromJson(Map<String, Object> json) {
    return ApiBaseError.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ApiBaseError = _$ApiBaseErrorTearOff();

/// @nodoc
mixin _$ApiBaseError {
  ErrorData get data;
  String get code;
  String get message;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ApiBaseErrorCopyWith<ApiBaseError> get copyWith;
}

/// @nodoc
abstract class $ApiBaseErrorCopyWith<$Res> {
  factory $ApiBaseErrorCopyWith(
          ApiBaseError value, $Res Function(ApiBaseError) then) =
      _$ApiBaseErrorCopyWithImpl<$Res>;
  $Res call({ErrorData data, String code, String message});

  $ErrorDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ApiBaseErrorCopyWithImpl<$Res> implements $ApiBaseErrorCopyWith<$Res> {
  _$ApiBaseErrorCopyWithImpl(this._value, this._then);

  final ApiBaseError _value;
  // ignore: unused_field
  final $Res Function(ApiBaseError) _then;

  @override
  $Res call({
    Object data = freezed,
    Object code = freezed,
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as ErrorData,
      code: code == freezed ? _value.code : code as String,
      message: message == freezed ? _value.message : message as String,
    ));
  }

  @override
  $ErrorDataCopyWith<$Res> get data {
    if (_value.data == null) {
      return null;
    }
    return $ErrorDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$ApiBaseErrorCopyWith<$Res>
    implements $ApiBaseErrorCopyWith<$Res> {
  factory _$ApiBaseErrorCopyWith(
          _ApiBaseError value, $Res Function(_ApiBaseError) then) =
      __$ApiBaseErrorCopyWithImpl<$Res>;
  @override
  $Res call({ErrorData data, String code, String message});

  @override
  $ErrorDataCopyWith<$Res> get data;
}

/// @nodoc
class __$ApiBaseErrorCopyWithImpl<$Res> extends _$ApiBaseErrorCopyWithImpl<$Res>
    implements _$ApiBaseErrorCopyWith<$Res> {
  __$ApiBaseErrorCopyWithImpl(
      _ApiBaseError _value, $Res Function(_ApiBaseError) _then)
      : super(_value, (v) => _then(v as _ApiBaseError));

  @override
  _ApiBaseError get _value => super._value as _ApiBaseError;

  @override
  $Res call({
    Object data = freezed,
    Object code = freezed,
    Object message = freezed,
  }) {
    return _then(_ApiBaseError(
      data: data == freezed ? _value.data : data as ErrorData,
      code: code == freezed ? _value.code : code as String,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ApiBaseError with DiagnosticableTreeMixin implements _ApiBaseError {
  _$_ApiBaseError({this.data, this.code, this.message});

  factory _$_ApiBaseError.fromJson(Map<String, dynamic> json) =>
      _$_$_ApiBaseErrorFromJson(json);

  @override
  final ErrorData data;
  @override
  final String code;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiBaseError(data: $data, code: $code, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiBaseError'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApiBaseError &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ApiBaseErrorCopyWith<_ApiBaseError> get copyWith =>
      __$ApiBaseErrorCopyWithImpl<_ApiBaseError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ApiBaseErrorToJson(this);
  }
}

abstract class _ApiBaseError implements ApiBaseError {
  factory _ApiBaseError({ErrorData data, String code, String message}) =
      _$_ApiBaseError;

  factory _ApiBaseError.fromJson(Map<String, dynamic> json) =
      _$_ApiBaseError.fromJson;

  @override
  ErrorData get data;
  @override
  String get code;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$ApiBaseErrorCopyWith<_ApiBaseError> get copyWith;
}

ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) {
  return _ErrorData.fromJson(json);
}

/// @nodoc
class _$ErrorDataTearOff {
  const _$ErrorDataTearOff();

// ignore: unused_element
  _ErrorData call({int status}) {
    return _ErrorData(
      status: status,
    );
  }

// ignore: unused_element
  ErrorData fromJson(Map<String, Object> json) {
    return ErrorData.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ErrorData = _$ErrorDataTearOff();

/// @nodoc
mixin _$ErrorData {
  int get status;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ErrorDataCopyWith<ErrorData> get copyWith;
}

/// @nodoc
abstract class $ErrorDataCopyWith<$Res> {
  factory $ErrorDataCopyWith(ErrorData value, $Res Function(ErrorData) then) =
      _$ErrorDataCopyWithImpl<$Res>;
  $Res call({int status});
}

/// @nodoc
class _$ErrorDataCopyWithImpl<$Res> implements $ErrorDataCopyWith<$Res> {
  _$ErrorDataCopyWithImpl(this._value, this._then);

  final ErrorData _value;
  // ignore: unused_field
  final $Res Function(ErrorData) _then;

  @override
  $Res call({
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as int,
    ));
  }
}

/// @nodoc
abstract class _$ErrorDataCopyWith<$Res> implements $ErrorDataCopyWith<$Res> {
  factory _$ErrorDataCopyWith(
          _ErrorData value, $Res Function(_ErrorData) then) =
      __$ErrorDataCopyWithImpl<$Res>;
  @override
  $Res call({int status});
}

/// @nodoc
class __$ErrorDataCopyWithImpl<$Res> extends _$ErrorDataCopyWithImpl<$Res>
    implements _$ErrorDataCopyWith<$Res> {
  __$ErrorDataCopyWithImpl(_ErrorData _value, $Res Function(_ErrorData) _then)
      : super(_value, (v) => _then(v as _ErrorData));

  @override
  _ErrorData get _value => super._value as _ErrorData;

  @override
  $Res call({
    Object status = freezed,
  }) {
    return _then(_ErrorData(
      status: status == freezed ? _value.status : status as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ErrorData with DiagnosticableTreeMixin implements _ErrorData {
  _$_ErrorData({this.status});

  factory _$_ErrorData.fromJson(Map<String, dynamic> json) =>
      _$_$_ErrorDataFromJson(json);

  @override
  final int status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorData(status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorData'))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorData &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$ErrorDataCopyWith<_ErrorData> get copyWith =>
      __$ErrorDataCopyWithImpl<_ErrorData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ErrorDataToJson(this);
  }
}

abstract class _ErrorData implements ErrorData {
  factory _ErrorData({int status}) = _$_ErrorData;

  factory _ErrorData.fromJson(Map<String, dynamic> json) =
      _$_ErrorData.fromJson;

  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$ErrorDataCopyWith<_ErrorData> get copyWith;
}
