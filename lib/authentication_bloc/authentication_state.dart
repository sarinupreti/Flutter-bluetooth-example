part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  fetching,
  authenticated,
  unauthenticated,
  connectedWebsites,
  isFirstTime,
  isEmailVerified,
  selectADefaultWebsite,
  isLogin,
  isSignUp,
  isResetPassword,
  passwordChanged,
  manageWebsite
}

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    AuthenticationStatus status,
    User auth,
    bool isLoading,
    WebsiteData currentWebsiteData,
    bool isFirstTime,
    int currentDateTime,
    String errorMessageSignUp,
    String errorMessageLogin,
    String errorMessageResetPassword,
    String errorMessageChangePassword,
    int currentTime,
    // PanExist panExist,
  }) = _AuthenticationState;
}
