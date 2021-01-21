part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.isSignedIn() =
      _AuthenticationEventIsSignedIn;
  const factory AuthenticationEvent.logOut() = _AuthenticationEventLogOut;

  const factory AuthenticationEvent.registerToFirebase({
    String email,
    String password,
    String name,
    BuildContext context,
  }) = _AuthenticationEventRegisterToFirebase;

  const factory AuthenticationEvent.loginToFirebase({
    String email,
    String password,
    BuildContext context,
  }) = _AuthenticationEventLoginToFirebase;

  const factory AuthenticationEvent.resetPassword({
    String email,
    BuildContext context,
  }) = _AuthenticationEventResetPassword;

  const factory AuthenticationEvent.connectAWebsite({
    String websiteUrl,
    String consumerKey,
    String consumerSecret,
    // String name,
    // String email,
    bool isLegacy,
    bool isFromManageWebsite,
    BuildContext context,
  }) = _AuthenticationEventConnectAWebsite;

  const factory AuthenticationEvent.selectDefaultWebsite({
    User user,
    WebsiteData websiteData,
    BuildContext context,
    bool isFromSettings,
  }) = _AuthenticationEventSelectDefaultWebsite;

  const factory AuthenticationEvent.scanQR({
    String consumerKey,
    String consumerSecret,
    BuildContext context,
  }) = _AuthenticationEventScanQr;

  const factory AuthenticationEvent.currentWebsite({
    BuildContext context,
  }) = _AuthenticationEventCurrentWebsite;

  const factory AuthenticationEvent.changePassword({
    String oldPassword,
    String newPassword,
    BuildContext context,
  }) = _AuthenticationEventChangePassword;
}
