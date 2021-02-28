// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TransactionEventTearOff {
  const _$TransactionEventTearOff();

// ignore: unused_element
  FetchHistoryEvent fetchHistory() {
    return const FetchHistoryEvent();
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionEvent = _$TransactionEventTearOff();

/// @nodoc
mixin _$TransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetchHistory(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetchHistory(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetchHistory(FetchHistoryEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetchHistory(FetchHistoryEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TransactionEventCopyWith<$Res> {
  factory $TransactionEventCopyWith(
          TransactionEvent value, $Res Function(TransactionEvent) then) =
      _$TransactionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionEventCopyWithImpl<$Res>
    implements $TransactionEventCopyWith<$Res> {
  _$TransactionEventCopyWithImpl(this._value, this._then);

  final TransactionEvent _value;
  // ignore: unused_field
  final $Res Function(TransactionEvent) _then;
}

/// @nodoc
abstract class $FetchHistoryEventCopyWith<$Res> {
  factory $FetchHistoryEventCopyWith(
          FetchHistoryEvent value, $Res Function(FetchHistoryEvent) then) =
      _$FetchHistoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchHistoryEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res>
    implements $FetchHistoryEventCopyWith<$Res> {
  _$FetchHistoryEventCopyWithImpl(
      FetchHistoryEvent _value, $Res Function(FetchHistoryEvent) _then)
      : super(_value, (v) => _then(v as FetchHistoryEvent));

  @override
  FetchHistoryEvent get _value => super._value as FetchHistoryEvent;
}

/// @nodoc
class _$FetchHistoryEvent implements FetchHistoryEvent {
  const _$FetchHistoryEvent();

  @override
  String toString() {
    return 'TransactionEvent.fetchHistory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchHistoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetchHistory(),
  }) {
    assert(fetchHistory != null);
    return fetchHistory();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetchHistory(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchHistory != null) {
      return fetchHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetchHistory(FetchHistoryEvent value),
  }) {
    assert(fetchHistory != null);
    return fetchHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetchHistory(FetchHistoryEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchHistory != null) {
      return fetchHistory(this);
    }
    return orElse();
  }
}

abstract class FetchHistoryEvent implements TransactionEvent {
  const factory FetchHistoryEvent() = _$FetchHistoryEvent;
}

/// @nodoc
class _$TransactionStateTearOff {
  const _$TransactionStateTearOff();

// ignore: unused_element
  _TransactionStateInitial initial() {
    return const _TransactionStateInitial();
  }

// ignore: unused_element
  _TransactionStateLoading loading() {
    return const _TransactionStateLoading();
  }

// ignore: unused_element
  _TransactionStateSuccess success(List<TransactionHistory> history) {
    return _TransactionStateSuccess(
      history,
    );
  }

// ignore: unused_element
  _TransactionStateFailure failure(String message) {
    return _TransactionStateFailure(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionState = _$TransactionStateTearOff();

/// @nodoc
mixin _$TransactionState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult success(List<TransactionHistory> history),
    @required TResult failure(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult success(List<TransactionHistory> history),
    TResult failure(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_TransactionStateInitial value),
    @required TResult loading(_TransactionStateLoading value),
    @required TResult success(_TransactionStateSuccess value),
    @required TResult failure(_TransactionStateFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_TransactionStateInitial value),
    TResult loading(_TransactionStateLoading value),
    TResult success(_TransactionStateSuccess value),
    TResult failure(_TransactionStateFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  final TransactionState _value;
  // ignore: unused_field
  final $Res Function(TransactionState) _then;
}

/// @nodoc
abstract class _$TransactionStateInitialCopyWith<$Res> {
  factory _$TransactionStateInitialCopyWith(_TransactionStateInitial value,
          $Res Function(_TransactionStateInitial) then) =
      __$TransactionStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$TransactionStateInitialCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateInitialCopyWith<$Res> {
  __$TransactionStateInitialCopyWithImpl(_TransactionStateInitial _value,
      $Res Function(_TransactionStateInitial) _then)
      : super(_value, (v) => _then(v as _TransactionStateInitial));

  @override
  _TransactionStateInitial get _value =>
      super._value as _TransactionStateInitial;
}

/// @nodoc
class _$_TransactionStateInitial implements _TransactionStateInitial {
  const _$_TransactionStateInitial();

  @override
  String toString() {
    return 'TransactionState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TransactionStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult success(List<TransactionHistory> history),
    @required TResult failure(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult success(List<TransactionHistory> history),
    TResult failure(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_TransactionStateInitial value),
    @required TResult loading(_TransactionStateLoading value),
    @required TResult success(_TransactionStateSuccess value),
    @required TResult failure(_TransactionStateFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_TransactionStateInitial value),
    TResult loading(_TransactionStateLoading value),
    TResult success(_TransactionStateSuccess value),
    TResult failure(_TransactionStateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TransactionStateInitial implements TransactionState {
  const factory _TransactionStateInitial() = _$_TransactionStateInitial;
}

/// @nodoc
abstract class _$TransactionStateLoadingCopyWith<$Res> {
  factory _$TransactionStateLoadingCopyWith(_TransactionStateLoading value,
          $Res Function(_TransactionStateLoading) then) =
      __$TransactionStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$TransactionStateLoadingCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateLoadingCopyWith<$Res> {
  __$TransactionStateLoadingCopyWithImpl(_TransactionStateLoading _value,
      $Res Function(_TransactionStateLoading) _then)
      : super(_value, (v) => _then(v as _TransactionStateLoading));

  @override
  _TransactionStateLoading get _value =>
      super._value as _TransactionStateLoading;
}

/// @nodoc
class _$_TransactionStateLoading implements _TransactionStateLoading {
  const _$_TransactionStateLoading();

  @override
  String toString() {
    return 'TransactionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TransactionStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult success(List<TransactionHistory> history),
    @required TResult failure(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult success(List<TransactionHistory> history),
    TResult failure(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_TransactionStateInitial value),
    @required TResult loading(_TransactionStateLoading value),
    @required TResult success(_TransactionStateSuccess value),
    @required TResult failure(_TransactionStateFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_TransactionStateInitial value),
    TResult loading(_TransactionStateLoading value),
    TResult success(_TransactionStateSuccess value),
    TResult failure(_TransactionStateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TransactionStateLoading implements TransactionState {
  const factory _TransactionStateLoading() = _$_TransactionStateLoading;
}

/// @nodoc
abstract class _$TransactionStateSuccessCopyWith<$Res> {
  factory _$TransactionStateSuccessCopyWith(_TransactionStateSuccess value,
          $Res Function(_TransactionStateSuccess) then) =
      __$TransactionStateSuccessCopyWithImpl<$Res>;
  $Res call({List<TransactionHistory> history});
}

/// @nodoc
class __$TransactionStateSuccessCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateSuccessCopyWith<$Res> {
  __$TransactionStateSuccessCopyWithImpl(_TransactionStateSuccess _value,
      $Res Function(_TransactionStateSuccess) _then)
      : super(_value, (v) => _then(v as _TransactionStateSuccess));

  @override
  _TransactionStateSuccess get _value =>
      super._value as _TransactionStateSuccess;

  @override
  $Res call({
    Object history = freezed,
  }) {
    return _then(_TransactionStateSuccess(
      history == freezed ? _value.history : history as List<TransactionHistory>,
    ));
  }
}

/// @nodoc
class _$_TransactionStateSuccess implements _TransactionStateSuccess {
  const _$_TransactionStateSuccess(this.history) : assert(history != null);

  @override
  final List<TransactionHistory> history;

  @override
  String toString() {
    return 'TransactionState.success(history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionStateSuccess &&
            (identical(other.history, history) ||
                const DeepCollectionEquality().equals(other.history, history)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(history);

  @JsonKey(ignore: true)
  @override
  _$TransactionStateSuccessCopyWith<_TransactionStateSuccess> get copyWith =>
      __$TransactionStateSuccessCopyWithImpl<_TransactionStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult success(List<TransactionHistory> history),
    @required TResult failure(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(history);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult success(List<TransactionHistory> history),
    TResult failure(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(history);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_TransactionStateInitial value),
    @required TResult loading(_TransactionStateLoading value),
    @required TResult success(_TransactionStateSuccess value),
    @required TResult failure(_TransactionStateFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_TransactionStateInitial value),
    TResult loading(_TransactionStateLoading value),
    TResult success(_TransactionStateSuccess value),
    TResult failure(_TransactionStateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _TransactionStateSuccess implements TransactionState {
  const factory _TransactionStateSuccess(List<TransactionHistory> history) =
      _$_TransactionStateSuccess;

  List<TransactionHistory> get history;
  @JsonKey(ignore: true)
  _$TransactionStateSuccessCopyWith<_TransactionStateSuccess> get copyWith;
}

/// @nodoc
abstract class _$TransactionStateFailureCopyWith<$Res> {
  factory _$TransactionStateFailureCopyWith(_TransactionStateFailure value,
          $Res Function(_TransactionStateFailure) then) =
      __$TransactionStateFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$TransactionStateFailureCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateFailureCopyWith<$Res> {
  __$TransactionStateFailureCopyWithImpl(_TransactionStateFailure _value,
      $Res Function(_TransactionStateFailure) _then)
      : super(_value, (v) => _then(v as _TransactionStateFailure));

  @override
  _TransactionStateFailure get _value =>
      super._value as _TransactionStateFailure;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_TransactionStateFailure(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_TransactionStateFailure implements _TransactionStateFailure {
  const _$_TransactionStateFailure(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionStateFailure &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$TransactionStateFailureCopyWith<_TransactionStateFailure> get copyWith =>
      __$TransactionStateFailureCopyWithImpl<_TransactionStateFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult success(List<TransactionHistory> history),
    @required TResult failure(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult success(List<TransactionHistory> history),
    TResult failure(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_TransactionStateInitial value),
    @required TResult loading(_TransactionStateLoading value),
    @required TResult success(_TransactionStateSuccess value),
    @required TResult failure(_TransactionStateFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_TransactionStateInitial value),
    TResult loading(_TransactionStateLoading value),
    TResult success(_TransactionStateSuccess value),
    TResult failure(_TransactionStateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _TransactionStateFailure implements TransactionState {
  const factory _TransactionStateFailure(String message) =
      _$_TransactionStateFailure;

  String get message;
  @JsonKey(ignore: true)
  _$TransactionStateFailureCopyWith<_TransactionStateFailure> get copyWith;
}
