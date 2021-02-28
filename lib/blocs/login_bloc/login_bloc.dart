// lib/blocs/login/login_bloc.dart

import 'package:bell_delivery_hub/blocs/authentication_bloc/authentication.dart';
import 'package:bell_delivery_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bell_delivery_hub/data/repo/authentication_service.dart';
import 'package:bell_delivery_hub/globals/exveptions/authentication_exception.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/login/request/login_request.dart';
import 'package:bloc/bloc.dart';

//
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationRepository _authenticationService;

  LoginBloc(AuthenticationBloc authenticationBloc,
      AuthenticationRepository authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      final websiteData = LoginRequest(
        email: event.email,
        password: event.password,
      );

      final data = await _authenticationService.loginWithCreds(websiteData);
      if (data.isSuccessful) {
        _authenticationBloc.add(UserLoggedIn(user: data.data));
        yield LoginSuccess();
      } else {
        yield LoginFailure(
            error: NetworkExceptions.getErrorMessage(data.error));
      }
    } on AuthenticationException catch (e) {
      yield LoginFailure(error: e.message);
    } catch (err) {
      yield LoginFailure(error: err.toString());
    }
  }
}
