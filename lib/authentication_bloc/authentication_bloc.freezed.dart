// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthenticationEventTearOff {
  const _$AuthenticationEventTearOff();

// ignore: unused_element
  _AuthenticationEventIsSignedIn isSignedIn() {
    return const _AuthenticationEventIsSignedIn();
  }

// ignore: unused_element
  _AuthenticationEventLogOut logOut() {
    return const _AuthenticationEventLogOut();
  }

// ignore: unused_element
  _AuthenticationEventRegisterToFirebase registerToFirebase(
      {String email, String password, String name, BuildContext context}) {
    return _AuthenticationEventRegisterToFirebase(
      email: email,
      password: password,
      name: name,
      context: context,
    );
  }

// ignore: unused_element
  _AuthenticationEventLoginToFirebase loginToFirebase(
      {String email, String password, BuildContext context}) {
    return _AuthenticationEventLoginToFirebase(
      email: email,
      password: password,
      context: context,
    );
  }

// ignore: unused_element
  _AuthenticationEventResetPassword resetPassword(
      {String email, BuildContext context}) {
    return _AuthenticationEventResetPassword(
      email: email,
      context: context,
    );
  }

// ignore: unused_element
  _AuthenticationEventConnectAWebsite connectAWebsite(
      {String websiteUrl,
      String consumerKey,
      String consumerSecret,
      bool isLegacy,
      bool isFromManageWebsite,
      BuildContext context}) {
    return _AuthenticationEventConnectAWebsite(
      websiteUrl: websiteUrl,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      isLegacy: isLegacy,
      isFromManageWebsite: isFromManageWebsite,
      context: context,
    );
  }

// ignore: unused_element
  _AuthenticationEventSelectDefaultWebsite selectDefaultWebsite(
      {User user,
      WebsiteData websiteData,
      BuildContext context,
      bool isFromSettings}) {
    return _AuthenticationEventSelectDefaultWebsite(
      user: user,
      websiteData: websiteData,
      context: context,
      isFromSettings: isFromSettings,
    );
  }

// ignore: unused_element
  _AuthenticationEventScanQr scanQR(
      {String consumerKey, String consumerSecret, BuildContext context}) {
    return _AuthenticationEventScanQr(
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      context: context,
    );
  }

// ignore: unused_element
  _AuthenticationEventCurrentWebsite currentWebsite({BuildContext context}) {
    return _AuthenticationEventCurrentWebsite(
      context: context,
    );
  }

// ignore: unused_element
  _AuthenticationEventChangePassword changePassword(
      {String oldPassword, String newPassword, BuildContext context}) {
    return _AuthenticationEventChangePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      context: context,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthenticationEvent = _$AuthenticationEventTearOff();

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  final AuthenticationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthenticationEvent) _then;
}

/// @nodoc
abstract class _$AuthenticationEventIsSignedInCopyWith<$Res> {
  factory _$AuthenticationEventIsSignedInCopyWith(
          _AuthenticationEventIsSignedIn value,
          $Res Function(_AuthenticationEventIsSignedIn) then) =
      __$AuthenticationEventIsSignedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthenticationEventIsSignedInCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventIsSignedInCopyWith<$Res> {
  __$AuthenticationEventIsSignedInCopyWithImpl(
      _AuthenticationEventIsSignedIn _value,
      $Res Function(_AuthenticationEventIsSignedIn) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventIsSignedIn));

  @override
  _AuthenticationEventIsSignedIn get _value =>
      super._value as _AuthenticationEventIsSignedIn;
}

/// @nodoc
class _$_AuthenticationEventIsSignedIn
    with DiagnosticableTreeMixin
    implements _AuthenticationEventIsSignedIn {
  const _$_AuthenticationEventIsSignedIn();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.isSignedIn()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationEvent.isSignedIn'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthenticationEventIsSignedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return isSignedIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isSignedIn != null) {
      return isSignedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return isSignedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isSignedIn != null) {
      return isSignedIn(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventIsSignedIn implements AuthenticationEvent {
  const factory _AuthenticationEventIsSignedIn() =
      _$_AuthenticationEventIsSignedIn;
}

/// @nodoc
abstract class _$AuthenticationEventLogOutCopyWith<$Res> {
  factory _$AuthenticationEventLogOutCopyWith(_AuthenticationEventLogOut value,
          $Res Function(_AuthenticationEventLogOut) then) =
      __$AuthenticationEventLogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthenticationEventLogOutCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventLogOutCopyWith<$Res> {
  __$AuthenticationEventLogOutCopyWithImpl(_AuthenticationEventLogOut _value,
      $Res Function(_AuthenticationEventLogOut) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventLogOut));

  @override
  _AuthenticationEventLogOut get _value =>
      super._value as _AuthenticationEventLogOut;
}

/// @nodoc
class _$_AuthenticationEventLogOut
    with DiagnosticableTreeMixin
    implements _AuthenticationEventLogOut {
  const _$_AuthenticationEventLogOut();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.logOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthenticationEvent.logOut'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthenticationEventLogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventLogOut implements AuthenticationEvent {
  const factory _AuthenticationEventLogOut() = _$_AuthenticationEventLogOut;
}

/// @nodoc
abstract class _$AuthenticationEventRegisterToFirebaseCopyWith<$Res> {
  factory _$AuthenticationEventRegisterToFirebaseCopyWith(
          _AuthenticationEventRegisterToFirebase value,
          $Res Function(_AuthenticationEventRegisterToFirebase) then) =
      __$AuthenticationEventRegisterToFirebaseCopyWithImpl<$Res>;
  $Res call({String email, String password, String name, BuildContext context});
}

/// @nodoc
class __$AuthenticationEventRegisterToFirebaseCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventRegisterToFirebaseCopyWith<$Res> {
  __$AuthenticationEventRegisterToFirebaseCopyWithImpl(
      _AuthenticationEventRegisterToFirebase _value,
      $Res Function(_AuthenticationEventRegisterToFirebase) _then)
      : super(
            _value, (v) => _then(v as _AuthenticationEventRegisterToFirebase));

  @override
  _AuthenticationEventRegisterToFirebase get _value =>
      super._value as _AuthenticationEventRegisterToFirebase;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object name = freezed,
    Object context = freezed,
  }) {
    return _then(_AuthenticationEventRegisterToFirebase(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      name: name == freezed ? _value.name : name as String,
      context: context == freezed ? _value.context : context as BuildContext,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventRegisterToFirebase
    with DiagnosticableTreeMixin
    implements _AuthenticationEventRegisterToFirebase {
  const _$_AuthenticationEventRegisterToFirebase(
      {this.email, this.password, this.name, this.context});

  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.registerToFirebase(email: $email, password: $password, name: $name, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'AuthenticationEvent.registerToFirebase'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventRegisterToFirebase &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventRegisterToFirebaseCopyWith<
          _AuthenticationEventRegisterToFirebase>
      get copyWith => __$AuthenticationEventRegisterToFirebaseCopyWithImpl<
          _AuthenticationEventRegisterToFirebase>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return registerToFirebase(email, password, name, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerToFirebase != null) {
      return registerToFirebase(email, password, name, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return registerToFirebase(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerToFirebase != null) {
      return registerToFirebase(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventRegisterToFirebase
    implements AuthenticationEvent {
  const factory _AuthenticationEventRegisterToFirebase(
      {String email,
      String password,
      String name,
      BuildContext context}) = _$_AuthenticationEventRegisterToFirebase;

  String get email;
  String get password;
  String get name;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$AuthenticationEventRegisterToFirebaseCopyWith<
      _AuthenticationEventRegisterToFirebase> get copyWith;
}

/// @nodoc
abstract class _$AuthenticationEventLoginToFirebaseCopyWith<$Res> {
  factory _$AuthenticationEventLoginToFirebaseCopyWith(
          _AuthenticationEventLoginToFirebase value,
          $Res Function(_AuthenticationEventLoginToFirebase) then) =
      __$AuthenticationEventLoginToFirebaseCopyWithImpl<$Res>;
  $Res call({String email, String password, BuildContext context});
}

/// @nodoc
class __$AuthenticationEventLoginToFirebaseCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventLoginToFirebaseCopyWith<$Res> {
  __$AuthenticationEventLoginToFirebaseCopyWithImpl(
      _AuthenticationEventLoginToFirebase _value,
      $Res Function(_AuthenticationEventLoginToFirebase) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventLoginToFirebase));

  @override
  _AuthenticationEventLoginToFirebase get _value =>
      super._value as _AuthenticationEventLoginToFirebase;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object context = freezed,
  }) {
    return _then(_AuthenticationEventLoginToFirebase(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      context: context == freezed ? _value.context : context as BuildContext,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventLoginToFirebase
    with DiagnosticableTreeMixin
    implements _AuthenticationEventLoginToFirebase {
  const _$_AuthenticationEventLoginToFirebase(
      {this.email, this.password, this.context});

  @override
  final String email;
  @override
  final String password;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.loginToFirebase(email: $email, password: $password, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationEvent.loginToFirebase'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventLoginToFirebase &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventLoginToFirebaseCopyWith<
          _AuthenticationEventLoginToFirebase>
      get copyWith => __$AuthenticationEventLoginToFirebaseCopyWithImpl<
          _AuthenticationEventLoginToFirebase>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return loginToFirebase(email, password, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loginToFirebase != null) {
      return loginToFirebase(email, password, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return loginToFirebase(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loginToFirebase != null) {
      return loginToFirebase(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventLoginToFirebase
    implements AuthenticationEvent {
  const factory _AuthenticationEventLoginToFirebase(
      {String email,
      String password,
      BuildContext context}) = _$_AuthenticationEventLoginToFirebase;

  String get email;
  String get password;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$AuthenticationEventLoginToFirebaseCopyWith<
      _AuthenticationEventLoginToFirebase> get copyWith;
}

/// @nodoc
abstract class _$AuthenticationEventResetPasswordCopyWith<$Res> {
  factory _$AuthenticationEventResetPasswordCopyWith(
          _AuthenticationEventResetPassword value,
          $Res Function(_AuthenticationEventResetPassword) then) =
      __$AuthenticationEventResetPasswordCopyWithImpl<$Res>;
  $Res call({String email, BuildContext context});
}

/// @nodoc
class __$AuthenticationEventResetPasswordCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventResetPasswordCopyWith<$Res> {
  __$AuthenticationEventResetPasswordCopyWithImpl(
      _AuthenticationEventResetPassword _value,
      $Res Function(_AuthenticationEventResetPassword) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventResetPassword));

  @override
  _AuthenticationEventResetPassword get _value =>
      super._value as _AuthenticationEventResetPassword;

  @override
  $Res call({
    Object email = freezed,
    Object context = freezed,
  }) {
    return _then(_AuthenticationEventResetPassword(
      email: email == freezed ? _value.email : email as String,
      context: context == freezed ? _value.context : context as BuildContext,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventResetPassword
    with DiagnosticableTreeMixin
    implements _AuthenticationEventResetPassword {
  const _$_AuthenticationEventResetPassword({this.email, this.context});

  @override
  final String email;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.resetPassword(email: $email, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationEvent.resetPassword'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventResetPassword &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventResetPasswordCopyWith<_AuthenticationEventResetPassword>
      get copyWith => __$AuthenticationEventResetPasswordCopyWithImpl<
          _AuthenticationEventResetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return resetPassword(email, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (resetPassword != null) {
      return resetPassword(email, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventResetPassword
    implements AuthenticationEvent {
  const factory _AuthenticationEventResetPassword(
      {String email,
      BuildContext context}) = _$_AuthenticationEventResetPassword;

  String get email;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$AuthenticationEventResetPasswordCopyWith<_AuthenticationEventResetPassword>
      get copyWith;
}

/// @nodoc
abstract class _$AuthenticationEventConnectAWebsiteCopyWith<$Res> {
  factory _$AuthenticationEventConnectAWebsiteCopyWith(
          _AuthenticationEventConnectAWebsite value,
          $Res Function(_AuthenticationEventConnectAWebsite) then) =
      __$AuthenticationEventConnectAWebsiteCopyWithImpl<$Res>;
  $Res call(
      {String websiteUrl,
      String consumerKey,
      String consumerSecret,
      bool isLegacy,
      bool isFromManageWebsite,
      BuildContext context});
}

/// @nodoc
class __$AuthenticationEventConnectAWebsiteCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventConnectAWebsiteCopyWith<$Res> {
  __$AuthenticationEventConnectAWebsiteCopyWithImpl(
      _AuthenticationEventConnectAWebsite _value,
      $Res Function(_AuthenticationEventConnectAWebsite) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventConnectAWebsite));

  @override
  _AuthenticationEventConnectAWebsite get _value =>
      super._value as _AuthenticationEventConnectAWebsite;

  @override
  $Res call({
    Object websiteUrl = freezed,
    Object consumerKey = freezed,
    Object consumerSecret = freezed,
    Object isLegacy = freezed,
    Object isFromManageWebsite = freezed,
    Object context = freezed,
  }) {
    return _then(_AuthenticationEventConnectAWebsite(
      websiteUrl:
          websiteUrl == freezed ? _value.websiteUrl : websiteUrl as String,
      consumerKey:
          consumerKey == freezed ? _value.consumerKey : consumerKey as String,
      consumerSecret: consumerSecret == freezed
          ? _value.consumerSecret
          : consumerSecret as String,
      isLegacy: isLegacy == freezed ? _value.isLegacy : isLegacy as bool,
      isFromManageWebsite: isFromManageWebsite == freezed
          ? _value.isFromManageWebsite
          : isFromManageWebsite as bool,
      context: context == freezed ? _value.context : context as BuildContext,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventConnectAWebsite
    with DiagnosticableTreeMixin
    implements _AuthenticationEventConnectAWebsite {
  const _$_AuthenticationEventConnectAWebsite(
      {this.websiteUrl,
      this.consumerKey,
      this.consumerSecret,
      this.isLegacy,
      this.isFromManageWebsite,
      this.context});

  @override
  final String websiteUrl;
  @override
  final String consumerKey;
  @override
  final String consumerSecret;
  @override // String name,
// String email,
  final bool isLegacy;
  @override
  final bool isFromManageWebsite;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.connectAWebsite(websiteUrl: $websiteUrl, consumerKey: $consumerKey, consumerSecret: $consumerSecret, isLegacy: $isLegacy, isFromManageWebsite: $isFromManageWebsite, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationEvent.connectAWebsite'))
      ..add(DiagnosticsProperty('websiteUrl', websiteUrl))
      ..add(DiagnosticsProperty('consumerKey', consumerKey))
      ..add(DiagnosticsProperty('consumerSecret', consumerSecret))
      ..add(DiagnosticsProperty('isLegacy', isLegacy))
      ..add(DiagnosticsProperty('isFromManageWebsite', isFromManageWebsite))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventConnectAWebsite &&
            (identical(other.websiteUrl, websiteUrl) ||
                const DeepCollectionEquality()
                    .equals(other.websiteUrl, websiteUrl)) &&
            (identical(other.consumerKey, consumerKey) ||
                const DeepCollectionEquality()
                    .equals(other.consumerKey, consumerKey)) &&
            (identical(other.consumerSecret, consumerSecret) ||
                const DeepCollectionEquality()
                    .equals(other.consumerSecret, consumerSecret)) &&
            (identical(other.isLegacy, isLegacy) ||
                const DeepCollectionEquality()
                    .equals(other.isLegacy, isLegacy)) &&
            (identical(other.isFromManageWebsite, isFromManageWebsite) ||
                const DeepCollectionEquality()
                    .equals(other.isFromManageWebsite, isFromManageWebsite)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(websiteUrl) ^
      const DeepCollectionEquality().hash(consumerKey) ^
      const DeepCollectionEquality().hash(consumerSecret) ^
      const DeepCollectionEquality().hash(isLegacy) ^
      const DeepCollectionEquality().hash(isFromManageWebsite) ^
      const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventConnectAWebsiteCopyWith<
          _AuthenticationEventConnectAWebsite>
      get copyWith => __$AuthenticationEventConnectAWebsiteCopyWithImpl<
          _AuthenticationEventConnectAWebsite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return connectAWebsite(websiteUrl, consumerKey, consumerSecret, isLegacy,
        isFromManageWebsite, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (connectAWebsite != null) {
      return connectAWebsite(websiteUrl, consumerKey, consumerSecret, isLegacy,
          isFromManageWebsite, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return connectAWebsite(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (connectAWebsite != null) {
      return connectAWebsite(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventConnectAWebsite
    implements AuthenticationEvent {
  const factory _AuthenticationEventConnectAWebsite(
      {String websiteUrl,
      String consumerKey,
      String consumerSecret,
      bool isLegacy,
      bool isFromManageWebsite,
      BuildContext context}) = _$_AuthenticationEventConnectAWebsite;

  String get websiteUrl;
  String get consumerKey;
  String get consumerSecret; // String name,
// String email,
  bool get isLegacy;
  bool get isFromManageWebsite;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$AuthenticationEventConnectAWebsiteCopyWith<
      _AuthenticationEventConnectAWebsite> get copyWith;
}

/// @nodoc
abstract class _$AuthenticationEventSelectDefaultWebsiteCopyWith<$Res> {
  factory _$AuthenticationEventSelectDefaultWebsiteCopyWith(
          _AuthenticationEventSelectDefaultWebsite value,
          $Res Function(_AuthenticationEventSelectDefaultWebsite) then) =
      __$AuthenticationEventSelectDefaultWebsiteCopyWithImpl<$Res>;
  $Res call(
      {User user,
      WebsiteData websiteData,
      BuildContext context,
      bool isFromSettings});
}

/// @nodoc
class __$AuthenticationEventSelectDefaultWebsiteCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventSelectDefaultWebsiteCopyWith<$Res> {
  __$AuthenticationEventSelectDefaultWebsiteCopyWithImpl(
      _AuthenticationEventSelectDefaultWebsite _value,
      $Res Function(_AuthenticationEventSelectDefaultWebsite) _then)
      : super(_value,
            (v) => _then(v as _AuthenticationEventSelectDefaultWebsite));

  @override
  _AuthenticationEventSelectDefaultWebsite get _value =>
      super._value as _AuthenticationEventSelectDefaultWebsite;

  @override
  $Res call({
    Object user = freezed,
    Object websiteData = freezed,
    Object context = freezed,
    Object isFromSettings = freezed,
  }) {
    return _then(_AuthenticationEventSelectDefaultWebsite(
      user: user == freezed ? _value.user : user as User,
      websiteData: websiteData == freezed
          ? _value.websiteData
          : websiteData as WebsiteData,
      context: context == freezed ? _value.context : context as BuildContext,
      isFromSettings: isFromSettings == freezed
          ? _value.isFromSettings
          : isFromSettings as bool,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventSelectDefaultWebsite
    with DiagnosticableTreeMixin
    implements _AuthenticationEventSelectDefaultWebsite {
  const _$_AuthenticationEventSelectDefaultWebsite(
      {this.user, this.websiteData, this.context, this.isFromSettings});

  @override
  final User user;
  @override
  final WebsiteData websiteData;
  @override
  final BuildContext context;
  @override
  final bool isFromSettings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.selectDefaultWebsite(user: $user, websiteData: $websiteData, context: $context, isFromSettings: $isFromSettings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'AuthenticationEvent.selectDefaultWebsite'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('websiteData', websiteData))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('isFromSettings', isFromSettings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventSelectDefaultWebsite &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.websiteData, websiteData) ||
                const DeepCollectionEquality()
                    .equals(other.websiteData, websiteData)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality()
                    .equals(other.context, context)) &&
            (identical(other.isFromSettings, isFromSettings) ||
                const DeepCollectionEquality()
                    .equals(other.isFromSettings, isFromSettings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(websiteData) ^
      const DeepCollectionEquality().hash(context) ^
      const DeepCollectionEquality().hash(isFromSettings);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventSelectDefaultWebsiteCopyWith<
          _AuthenticationEventSelectDefaultWebsite>
      get copyWith => __$AuthenticationEventSelectDefaultWebsiteCopyWithImpl<
          _AuthenticationEventSelectDefaultWebsite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return selectDefaultWebsite(user, websiteData, context, isFromSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDefaultWebsite != null) {
      return selectDefaultWebsite(user, websiteData, context, isFromSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return selectDefaultWebsite(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDefaultWebsite != null) {
      return selectDefaultWebsite(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventSelectDefaultWebsite
    implements AuthenticationEvent {
  const factory _AuthenticationEventSelectDefaultWebsite(
      {User user,
      WebsiteData websiteData,
      BuildContext context,
      bool isFromSettings}) = _$_AuthenticationEventSelectDefaultWebsite;

  User get user;
  WebsiteData get websiteData;
  BuildContext get context;
  bool get isFromSettings;
  @JsonKey(ignore: true)
  _$AuthenticationEventSelectDefaultWebsiteCopyWith<
      _AuthenticationEventSelectDefaultWebsite> get copyWith;
}

/// @nodoc
abstract class _$AuthenticationEventScanQrCopyWith<$Res> {
  factory _$AuthenticationEventScanQrCopyWith(_AuthenticationEventScanQr value,
          $Res Function(_AuthenticationEventScanQr) then) =
      __$AuthenticationEventScanQrCopyWithImpl<$Res>;
  $Res call({String consumerKey, String consumerSecret, BuildContext context});
}

/// @nodoc
class __$AuthenticationEventScanQrCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventScanQrCopyWith<$Res> {
  __$AuthenticationEventScanQrCopyWithImpl(_AuthenticationEventScanQr _value,
      $Res Function(_AuthenticationEventScanQr) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventScanQr));

  @override
  _AuthenticationEventScanQr get _value =>
      super._value as _AuthenticationEventScanQr;

  @override
  $Res call({
    Object consumerKey = freezed,
    Object consumerSecret = freezed,
    Object context = freezed,
  }) {
    return _then(_AuthenticationEventScanQr(
      consumerKey:
          consumerKey == freezed ? _value.consumerKey : consumerKey as String,
      consumerSecret: consumerSecret == freezed
          ? _value.consumerSecret
          : consumerSecret as String,
      context: context == freezed ? _value.context : context as BuildContext,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventScanQr
    with DiagnosticableTreeMixin
    implements _AuthenticationEventScanQr {
  const _$_AuthenticationEventScanQr(
      {this.consumerKey, this.consumerSecret, this.context});

  @override
  final String consumerKey;
  @override
  final String consumerSecret;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.scanQR(consumerKey: $consumerKey, consumerSecret: $consumerSecret, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationEvent.scanQR'))
      ..add(DiagnosticsProperty('consumerKey', consumerKey))
      ..add(DiagnosticsProperty('consumerSecret', consumerSecret))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventScanQr &&
            (identical(other.consumerKey, consumerKey) ||
                const DeepCollectionEquality()
                    .equals(other.consumerKey, consumerKey)) &&
            (identical(other.consumerSecret, consumerSecret) ||
                const DeepCollectionEquality()
                    .equals(other.consumerSecret, consumerSecret)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(consumerKey) ^
      const DeepCollectionEquality().hash(consumerSecret) ^
      const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventScanQrCopyWith<_AuthenticationEventScanQr>
      get copyWith =>
          __$AuthenticationEventScanQrCopyWithImpl<_AuthenticationEventScanQr>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return scanQR(consumerKey, consumerSecret, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanQR != null) {
      return scanQR(consumerKey, consumerSecret, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return scanQR(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanQR != null) {
      return scanQR(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventScanQr implements AuthenticationEvent {
  const factory _AuthenticationEventScanQr(
      {String consumerKey,
      String consumerSecret,
      BuildContext context}) = _$_AuthenticationEventScanQr;

  String get consumerKey;
  String get consumerSecret;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$AuthenticationEventScanQrCopyWith<_AuthenticationEventScanQr> get copyWith;
}

/// @nodoc
abstract class _$AuthenticationEventCurrentWebsiteCopyWith<$Res> {
  factory _$AuthenticationEventCurrentWebsiteCopyWith(
          _AuthenticationEventCurrentWebsite value,
          $Res Function(_AuthenticationEventCurrentWebsite) then) =
      __$AuthenticationEventCurrentWebsiteCopyWithImpl<$Res>;
  $Res call({BuildContext context});
}

/// @nodoc
class __$AuthenticationEventCurrentWebsiteCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventCurrentWebsiteCopyWith<$Res> {
  __$AuthenticationEventCurrentWebsiteCopyWithImpl(
      _AuthenticationEventCurrentWebsite _value,
      $Res Function(_AuthenticationEventCurrentWebsite) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventCurrentWebsite));

  @override
  _AuthenticationEventCurrentWebsite get _value =>
      super._value as _AuthenticationEventCurrentWebsite;

  @override
  $Res call({
    Object context = freezed,
  }) {
    return _then(_AuthenticationEventCurrentWebsite(
      context: context == freezed ? _value.context : context as BuildContext,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventCurrentWebsite
    with DiagnosticableTreeMixin
    implements _AuthenticationEventCurrentWebsite {
  const _$_AuthenticationEventCurrentWebsite({this.context});

  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.currentWebsite(context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationEvent.currentWebsite'))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventCurrentWebsite &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventCurrentWebsiteCopyWith<
          _AuthenticationEventCurrentWebsite>
      get copyWith => __$AuthenticationEventCurrentWebsiteCopyWithImpl<
          _AuthenticationEventCurrentWebsite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return currentWebsite(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (currentWebsite != null) {
      return currentWebsite(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return currentWebsite(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (currentWebsite != null) {
      return currentWebsite(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventCurrentWebsite
    implements AuthenticationEvent {
  const factory _AuthenticationEventCurrentWebsite({BuildContext context}) =
      _$_AuthenticationEventCurrentWebsite;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$AuthenticationEventCurrentWebsiteCopyWith<
      _AuthenticationEventCurrentWebsite> get copyWith;
}

/// @nodoc
abstract class _$AuthenticationEventChangePasswordCopyWith<$Res> {
  factory _$AuthenticationEventChangePasswordCopyWith(
          _AuthenticationEventChangePassword value,
          $Res Function(_AuthenticationEventChangePassword) then) =
      __$AuthenticationEventChangePasswordCopyWithImpl<$Res>;
  $Res call({String oldPassword, String newPassword, BuildContext context});
}

/// @nodoc
class __$AuthenticationEventChangePasswordCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticationEventChangePasswordCopyWith<$Res> {
  __$AuthenticationEventChangePasswordCopyWithImpl(
      _AuthenticationEventChangePassword _value,
      $Res Function(_AuthenticationEventChangePassword) _then)
      : super(_value, (v) => _then(v as _AuthenticationEventChangePassword));

  @override
  _AuthenticationEventChangePassword get _value =>
      super._value as _AuthenticationEventChangePassword;

  @override
  $Res call({
    Object oldPassword = freezed,
    Object newPassword = freezed,
    Object context = freezed,
  }) {
    return _then(_AuthenticationEventChangePassword(
      oldPassword:
          oldPassword == freezed ? _value.oldPassword : oldPassword as String,
      newPassword:
          newPassword == freezed ? _value.newPassword : newPassword as String,
      context: context == freezed ? _value.context : context as BuildContext,
    ));
  }
}

/// @nodoc
class _$_AuthenticationEventChangePassword
    with DiagnosticableTreeMixin
    implements _AuthenticationEventChangePassword {
  const _$_AuthenticationEventChangePassword(
      {this.oldPassword, this.newPassword, this.context});

  @override
  final String oldPassword;
  @override
  final String newPassword;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationEvent.changePassword(oldPassword: $oldPassword, newPassword: $newPassword, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationEvent.changePassword'))
      ..add(DiagnosticsProperty('oldPassword', oldPassword))
      ..add(DiagnosticsProperty('newPassword', newPassword))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationEventChangePassword &&
            (identical(other.oldPassword, oldPassword) ||
                const DeepCollectionEquality()
                    .equals(other.oldPassword, oldPassword)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(oldPassword) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationEventChangePasswordCopyWith<
          _AuthenticationEventChangePassword>
      get copyWith => __$AuthenticationEventChangePasswordCopyWithImpl<
          _AuthenticationEventChangePassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult isSignedIn(),
    @required TResult logOut(),
    @required
        TResult registerToFirebase(
            String email, String password, String name, BuildContext context),
    @required
        TResult loginToFirebase(
            String email, String password, BuildContext context),
    @required TResult resetPassword(String email, BuildContext context),
    @required
        TResult connectAWebsite(
            String websiteUrl,
            String consumerKey,
            String consumerSecret,
            bool isLegacy,
            bool isFromManageWebsite,
            BuildContext context),
    @required
        TResult selectDefaultWebsite(User user, WebsiteData websiteData,
            BuildContext context, bool isFromSettings),
    @required
        TResult scanQR(
            String consumerKey, String consumerSecret, BuildContext context),
    @required TResult currentWebsite(BuildContext context),
    @required
        TResult changePassword(
            String oldPassword, String newPassword, BuildContext context),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return changePassword(oldPassword, newPassword, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult isSignedIn(),
    TResult logOut(),
    TResult registerToFirebase(
        String email, String password, String name, BuildContext context),
    TResult loginToFirebase(
        String email, String password, BuildContext context),
    TResult resetPassword(String email, BuildContext context),
    TResult connectAWebsite(
        String websiteUrl,
        String consumerKey,
        String consumerSecret,
        bool isLegacy,
        bool isFromManageWebsite,
        BuildContext context),
    TResult selectDefaultWebsite(User user, WebsiteData websiteData,
        BuildContext context, bool isFromSettings),
    TResult scanQR(
        String consumerKey, String consumerSecret, BuildContext context),
    TResult currentWebsite(BuildContext context),
    TResult changePassword(
        String oldPassword, String newPassword, BuildContext context),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(oldPassword, newPassword, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    @required TResult logOut(_AuthenticationEventLogOut value),
    @required
        TResult registerToFirebase(
            _AuthenticationEventRegisterToFirebase value),
    @required
        TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    @required TResult resetPassword(_AuthenticationEventResetPassword value),
    @required
        TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    @required
        TResult selectDefaultWebsite(
            _AuthenticationEventSelectDefaultWebsite value),
    @required TResult scanQR(_AuthenticationEventScanQr value),
    @required TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    @required TResult changePassword(_AuthenticationEventChangePassword value),
  }) {
    assert(isSignedIn != null);
    assert(logOut != null);
    assert(registerToFirebase != null);
    assert(loginToFirebase != null);
    assert(resetPassword != null);
    assert(connectAWebsite != null);
    assert(selectDefaultWebsite != null);
    assert(scanQR != null);
    assert(currentWebsite != null);
    assert(changePassword != null);
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult isSignedIn(_AuthenticationEventIsSignedIn value),
    TResult logOut(_AuthenticationEventLogOut value),
    TResult registerToFirebase(_AuthenticationEventRegisterToFirebase value),
    TResult loginToFirebase(_AuthenticationEventLoginToFirebase value),
    TResult resetPassword(_AuthenticationEventResetPassword value),
    TResult connectAWebsite(_AuthenticationEventConnectAWebsite value),
    TResult selectDefaultWebsite(
        _AuthenticationEventSelectDefaultWebsite value),
    TResult scanQR(_AuthenticationEventScanQr value),
    TResult currentWebsite(_AuthenticationEventCurrentWebsite value),
    TResult changePassword(_AuthenticationEventChangePassword value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationEventChangePassword
    implements AuthenticationEvent {
  const factory _AuthenticationEventChangePassword(
      {String oldPassword,
      String newPassword,
      BuildContext context}) = _$_AuthenticationEventChangePassword;

  String get oldPassword;
  String get newPassword;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$AuthenticationEventChangePasswordCopyWith<
      _AuthenticationEventChangePassword> get copyWith;
}

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

// ignore: unused_element
  _AuthenticationState call(
      {AuthenticationStatus status,
      User auth,
      bool isLoading,
      WebsiteData currentWebsiteData,
      bool isFirstTime,
      int currentDateTime,
      String errorMessageSignUp,
      String errorMessageLogin,
      String errorMessageResetPassword,
      String errorMessageChangePassword,
      int currentTime}) {
    return _AuthenticationState(
      status: status,
      auth: auth,
      isLoading: isLoading,
      currentWebsiteData: currentWebsiteData,
      isFirstTime: isFirstTime,
      currentDateTime: currentDateTime,
      errorMessageSignUp: errorMessageSignUp,
      errorMessageLogin: errorMessageLogin,
      errorMessageResetPassword: errorMessageResetPassword,
      errorMessageChangePassword: errorMessageChangePassword,
      currentTime: currentTime,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  AuthenticationStatus get status;
  User get auth;
  bool get isLoading;
  WebsiteData get currentWebsiteData;
  bool get isFirstTime;
  int get currentDateTime;
  String get errorMessageSignUp;
  String get errorMessageLogin;
  String get errorMessageResetPassword;
  String get errorMessageChangePassword;
  int get currentTime;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
  $Res call(
      {AuthenticationStatus status,
      User auth,
      bool isLoading,
      WebsiteData currentWebsiteData,
      bool isFirstTime,
      int currentDateTime,
      String errorMessageSignUp,
      String errorMessageLogin,
      String errorMessageResetPassword,
      String errorMessageChangePassword,
      int currentTime});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;

  @override
  $Res call({
    Object status = freezed,
    Object auth = freezed,
    Object isLoading = freezed,
    Object currentWebsiteData = freezed,
    Object isFirstTime = freezed,
    Object currentDateTime = freezed,
    Object errorMessageSignUp = freezed,
    Object errorMessageLogin = freezed,
    Object errorMessageResetPassword = freezed,
    Object errorMessageChangePassword = freezed,
    Object currentTime = freezed,
  }) {
    return _then(_value.copyWith(
      status:
          status == freezed ? _value.status : status as AuthenticationStatus,
      auth: auth == freezed ? _value.auth : auth as User,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentWebsiteData: currentWebsiteData == freezed
          ? _value.currentWebsiteData
          : currentWebsiteData as WebsiteData,
      isFirstTime:
          isFirstTime == freezed ? _value.isFirstTime : isFirstTime as bool,
      currentDateTime: currentDateTime == freezed
          ? _value.currentDateTime
          : currentDateTime as int,
      errorMessageSignUp: errorMessageSignUp == freezed
          ? _value.errorMessageSignUp
          : errorMessageSignUp as String,
      errorMessageLogin: errorMessageLogin == freezed
          ? _value.errorMessageLogin
          : errorMessageLogin as String,
      errorMessageResetPassword: errorMessageResetPassword == freezed
          ? _value.errorMessageResetPassword
          : errorMessageResetPassword as String,
      errorMessageChangePassword: errorMessageChangePassword == freezed
          ? _value.errorMessageChangePassword
          : errorMessageChangePassword as String,
      currentTime:
          currentTime == freezed ? _value.currentTime : currentTime as int,
    ));
  }
}

/// @nodoc
abstract class _$AuthenticationStateCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$AuthenticationStateCopyWith(_AuthenticationState value,
          $Res Function(_AuthenticationState) then) =
      __$AuthenticationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthenticationStatus status,
      User auth,
      bool isLoading,
      WebsiteData currentWebsiteData,
      bool isFirstTime,
      int currentDateTime,
      String errorMessageSignUp,
      String errorMessageLogin,
      String errorMessageResetPassword,
      String errorMessageChangePassword,
      int currentTime});
}

/// @nodoc
class __$AuthenticationStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$AuthenticationStateCopyWith<$Res> {
  __$AuthenticationStateCopyWithImpl(
      _AuthenticationState _value, $Res Function(_AuthenticationState) _then)
      : super(_value, (v) => _then(v as _AuthenticationState));

  @override
  _AuthenticationState get _value => super._value as _AuthenticationState;

  @override
  $Res call({
    Object status = freezed,
    Object auth = freezed,
    Object isLoading = freezed,
    Object currentWebsiteData = freezed,
    Object isFirstTime = freezed,
    Object currentDateTime = freezed,
    Object errorMessageSignUp = freezed,
    Object errorMessageLogin = freezed,
    Object errorMessageResetPassword = freezed,
    Object errorMessageChangePassword = freezed,
    Object currentTime = freezed,
  }) {
    return _then(_AuthenticationState(
      status:
          status == freezed ? _value.status : status as AuthenticationStatus,
      auth: auth == freezed ? _value.auth : auth as User,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentWebsiteData: currentWebsiteData == freezed
          ? _value.currentWebsiteData
          : currentWebsiteData as WebsiteData,
      isFirstTime:
          isFirstTime == freezed ? _value.isFirstTime : isFirstTime as bool,
      currentDateTime: currentDateTime == freezed
          ? _value.currentDateTime
          : currentDateTime as int,
      errorMessageSignUp: errorMessageSignUp == freezed
          ? _value.errorMessageSignUp
          : errorMessageSignUp as String,
      errorMessageLogin: errorMessageLogin == freezed
          ? _value.errorMessageLogin
          : errorMessageLogin as String,
      errorMessageResetPassword: errorMessageResetPassword == freezed
          ? _value.errorMessageResetPassword
          : errorMessageResetPassword as String,
      errorMessageChangePassword: errorMessageChangePassword == freezed
          ? _value.errorMessageChangePassword
          : errorMessageChangePassword as String,
      currentTime:
          currentTime == freezed ? _value.currentTime : currentTime as int,
    ));
  }
}

/// @nodoc
class _$_AuthenticationState
    with DiagnosticableTreeMixin
    implements _AuthenticationState {
  const _$_AuthenticationState(
      {this.status,
      this.auth,
      this.isLoading,
      this.currentWebsiteData,
      this.isFirstTime,
      this.currentDateTime,
      this.errorMessageSignUp,
      this.errorMessageLogin,
      this.errorMessageResetPassword,
      this.errorMessageChangePassword,
      this.currentTime});

  @override
  final AuthenticationStatus status;
  @override
  final User auth;
  @override
  final bool isLoading;
  @override
  final WebsiteData currentWebsiteData;
  @override
  final bool isFirstTime;
  @override
  final int currentDateTime;
  @override
  final String errorMessageSignUp;
  @override
  final String errorMessageLogin;
  @override
  final String errorMessageResetPassword;
  @override
  final String errorMessageChangePassword;
  @override
  final int currentTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationState(status: $status, auth: $auth, isLoading: $isLoading, currentWebsiteData: $currentWebsiteData, isFirstTime: $isFirstTime, currentDateTime: $currentDateTime, errorMessageSignUp: $errorMessageSignUp, errorMessageLogin: $errorMessageLogin, errorMessageResetPassword: $errorMessageResetPassword, errorMessageChangePassword: $errorMessageChangePassword, currentTime: $currentTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('auth', auth))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('currentWebsiteData', currentWebsiteData))
      ..add(DiagnosticsProperty('isFirstTime', isFirstTime))
      ..add(DiagnosticsProperty('currentDateTime', currentDateTime))
      ..add(DiagnosticsProperty('errorMessageSignUp', errorMessageSignUp))
      ..add(DiagnosticsProperty('errorMessageLogin', errorMessageLogin))
      ..add(DiagnosticsProperty(
          'errorMessageResetPassword', errorMessageResetPassword))
      ..add(DiagnosticsProperty(
          'errorMessageChangePassword', errorMessageChangePassword))
      ..add(DiagnosticsProperty('currentTime', currentTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthenticationState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.auth, auth) ||
                const DeepCollectionEquality().equals(other.auth, auth)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.currentWebsiteData, currentWebsiteData) ||
                const DeepCollectionEquality()
                    .equals(other.currentWebsiteData, currentWebsiteData)) &&
            (identical(other.isFirstTime, isFirstTime) ||
                const DeepCollectionEquality()
                    .equals(other.isFirstTime, isFirstTime)) &&
            (identical(other.currentDateTime, currentDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.currentDateTime, currentDateTime)) &&
            (identical(other.errorMessageSignUp, errorMessageSignUp) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessageSignUp, errorMessageSignUp)) &&
            (identical(other.errorMessageLogin, errorMessageLogin) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessageLogin, errorMessageLogin)) &&
            (identical(other.errorMessageResetPassword,
                    errorMessageResetPassword) ||
                const DeepCollectionEquality().equals(
                    other.errorMessageResetPassword,
                    errorMessageResetPassword)) &&
            (identical(other.errorMessageChangePassword,
                    errorMessageChangePassword) ||
                const DeepCollectionEquality().equals(
                    other.errorMessageChangePassword,
                    errorMessageChangePassword)) &&
            (identical(other.currentTime, currentTime) ||
                const DeepCollectionEquality()
                    .equals(other.currentTime, currentTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(auth) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(currentWebsiteData) ^
      const DeepCollectionEquality().hash(isFirstTime) ^
      const DeepCollectionEquality().hash(currentDateTime) ^
      const DeepCollectionEquality().hash(errorMessageSignUp) ^
      const DeepCollectionEquality().hash(errorMessageLogin) ^
      const DeepCollectionEquality().hash(errorMessageResetPassword) ^
      const DeepCollectionEquality().hash(errorMessageChangePassword) ^
      const DeepCollectionEquality().hash(currentTime);

  @JsonKey(ignore: true)
  @override
  _$AuthenticationStateCopyWith<_AuthenticationState> get copyWith =>
      __$AuthenticationStateCopyWithImpl<_AuthenticationState>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  const factory _AuthenticationState(
      {AuthenticationStatus status,
      User auth,
      bool isLoading,
      WebsiteData currentWebsiteData,
      bool isFirstTime,
      int currentDateTime,
      String errorMessageSignUp,
      String errorMessageLogin,
      String errorMessageResetPassword,
      String errorMessageChangePassword,
      int currentTime}) = _$_AuthenticationState;

  @override
  AuthenticationStatus get status;
  @override
  User get auth;
  @override
  bool get isLoading;
  @override
  WebsiteData get currentWebsiteData;
  @override
  bool get isFirstTime;
  @override
  int get currentDateTime;
  @override
  String get errorMessageSignUp;
  @override
  String get errorMessageLogin;
  @override
  String get errorMessageResetPassword;
  @override
  String get errorMessageChangePassword;
  @override
  int get currentTime;
  @override
  @JsonKey(ignore: true)
  _$AuthenticationStateCopyWith<_AuthenticationState> get copyWith;
}
