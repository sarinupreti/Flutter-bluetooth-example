import 'package:bots_demo/modal/api_base_error.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class Failure extends Equatable {
  @override
  List<Object> get props => null;
}

class RefreshTokenFailure extends Failure {
  final String error;
  RefreshTokenFailure({this.error});
  @override
  List<Object> get props => [error];
}

// General failures
class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message});
  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {}

class InternetFailure extends Failure {}

class EmailValidationFailure extends Failure {
  final String error;
  EmailValidationFailure({this.error});
  @override
  List<Object> get props => [error];
}

class LoginFailure extends Failure {
  final Object error;
  LoginFailure({this.error});
  @override
  List<Object> get props => [error];
}

class LogoutFailure extends Failure {}

class RegisterFailure extends Failure {
  final Object error;
  RegisterFailure({this.error});
  @override
  List<Object> get props => [error];
}

class ResponseFailure extends Failure {
  final Object error;
  final int errorCode;
  final ErrorData errorData;
  ResponseFailure({this.error, this.errorCode, this.errorData});
  @override
  List<Object> get props => [error, errorCode, errorData];
}

class ErrorData extends Failure {
  final String message;

  ErrorData({this.message});
  @override
  List<Object> get props => [message];
}

class AccountLinkFailure extends Failure {
  AccountLinkFailure(this.error);
  final ApiBaseError error;
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return failure is ServerFailure
          ? failure.message?.toString() ??
              "Server Error: Something went wrong with the network."
          : '';
      break;
    case CacheFailure:
      return "Failed to cache data.";
      break;
    case InternetFailure:
      return "Internet not working.";
      break;
    case EmailValidationFailure:
      return (failure as EmailValidationFailure).error.toString();
      break;
    case ResponseFailure:
      return (failure as ResponseFailure).errorData.message.toString();
      break;
    case LoginFailure:
      return (failure as LoginFailure).error.toString();

      break;
    case RegisterFailure:
      return (failure as RegisterFailure).error.toString();

    case LogoutFailure:
      return 'Unable to logout';
      break;

    default:
      return "Something went wrong.";
  }
}

void eventsmoDP(String message, {String heading}) {
  // debugPrint('\n\n=======================================================');
  // debugPrint('       ${heading ?? 'DEBUG PRINT'} ');
  // debugPrint(message ?? '');
  // debugPrint('=======================================================\n\n');
}

class InternetFailureException implements Exception {
  final String message = 'There is no internet connection available';

  final http.BaseRequest baseRequest;

  InternetFailureException({
    @required this.baseRequest,
  });

  @override
  String toString() => message;
}

class ResponseFailureException implements Exception {
  ResponseFailureException({
    @required this.baseRequest,
    @required this.error,
  });

  final ApiBaseError error;
  final http.BaseRequest baseRequest;

  @override
  String toString() => error?.message;
}
