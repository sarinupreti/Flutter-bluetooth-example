import 'dart:async';

import 'package:bell_delivery_hub/authentication_bloc/repository/authentication_service.dart';
import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationService;

  AuthenticationBloc(AuthenticationRepository authenticationService)
      : assert(authenticationService != null),
        _authenticationService = authenticationService,
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }

    if (event is IsLoggedIn) {
      yield* _mapCheckLoggedInState(event);
    }
  }

  Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthenticationLoading();
    try {
      final currentUser = await _authenticationService.getAuth();

      if (currentUser != null) {
        yield AuthenticationAuthenticated(websiteData: currentUser);
      } else {
        yield AuthenticationNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(
      UserLoggedIn event) async* {
    yield AuthenticationAuthenticated(websiteData: event.websiteData);
  }

  Stream<AuthenticationState> _mapCheckLoggedInState(IsLoggedIn event) async* {
    yield AuthenticationLoading();

    final data = await _authenticationService.getAuth();

    if (data != null &&
        data.consumerKey != null &&
        data.consumerSecret != null) {
      yield AuthenticationAuthenticated(websiteData: data);
    } else {
      yield AuthenticationNotAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(
      UserLoggedOut event) async* {
    await _authenticationService.logOut();
    yield AuthenticationNotAuthenticated();
  }
}
