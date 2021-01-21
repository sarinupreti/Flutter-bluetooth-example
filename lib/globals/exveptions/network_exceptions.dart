import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.defaultException(String message) =
      DefaultException;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.woocommerceLoginError(String message) =
      WoocommerceLoginError;

  const factory NetworkExceptions.invalidUrlAddress() = InvalidUrlAddress;

  const factory NetworkExceptions.invalidAppPassword(String message) =
      InvalidAppPassword;

  const factory NetworkExceptions.websiteAlreadyExists() = WebsiteAlreadyExists;

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.CANCEL:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.DEFAULT:
              networkExceptions = NetworkExceptions.defaultException(
                  error != null &&
                          error.message != null &&
                          error.message.isNotEmpty
                      ? error.message
                      : error.response.statusMessage.toString());
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.RESPONSE:
              if (error.response.statusCode == 400) {
                networkExceptions = NetworkExceptions.unauthorisedRequest();
              } else if (error.response.statusCode == 401 &&
                      error.response.data["code"] ==
                          "woocommerce_rest_cannot_view" ||
                  error.response.data["code"] ==
                      "woocommerce_rest_authentication_error") {
                networkExceptions = NetworkExceptions.woocommerceLoginError(
                    error.response.data["message"]);
              } else if (error.response.statusCode == 401 &&
                      error.response.data["code"] == "incorrect_password" ||
                  error.response.data["code"] == "invalid_username") {
                networkExceptions = NetworkExceptions.invalidAppPassword(
                    error.response.data["message"]);
              } else if (error.response.statusCode == 401) {
                networkExceptions = NetworkExceptions.unauthorisedRequest();
              } else if (error.response.statusCode == 403) {
                networkExceptions = NetworkExceptions.unauthorisedRequest();
              } else if (error.response.statusCode == 404) {
                networkExceptions = NetworkExceptions.notFound("Not found");
              } else if (error.response.statusCode == 409) {
                networkExceptions = NetworkExceptions.conflict();
              } else if (error.response.statusCode == 408) {
                networkExceptions = NetworkExceptions.requestTimeout();
              } else if (error.response.statusCode == 500) {
                networkExceptions = NetworkExceptions.internalServerError();
              } else if (error.response.statusCode == 503) {
                networkExceptions = NetworkExceptions.serviceUnavailable();
              } else {
                var responseCode = error.response.statusCode;
                networkExceptions = NetworkExceptions.defaultError(
                  "Received invalid status code: $responseCode",
                );
              }

              break;
            case DioErrorType.SEND_TIMEOUT:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is FirebaseAuthException) {
          print(error);
          if (error.code == "too-many-requests") {
            networkExceptions = NetworkExceptions.defaultError(error.message);
          } else if (error.code == "user-not-found") {
            networkExceptions = NetworkExceptions.defaultError(error.message);
          } else
            networkExceptions =
                NetworkExceptions.woocommerceLoginError(error.message);
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        print(e);
        // Helper.printError(e.toString());
        return NetworkExceptions.formatException();
      } catch (e) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorisedRequest: () {
      errorMessage = "Unauthorised request";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, defaultException: (data) {
      errorMessage = data.isNotEmpty ? data : "Something went wrong.";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    }, woocommerceLoginError: (String message) {
      errorMessage = message != null && message.isNotEmpty
          ? message
          : "Invalid consumer key and secret.";
    }, invalidUrlAddress: () {
      errorMessage = "Invalid website address.";
    }, invalidAppPassword: (String message) {
      errorMessage = message ?? "Invalid application password.";
    }, websiteAlreadyExists: () {
      errorMessage = "Website already exists or linked with this account.";
    });
    return errorMessage;
  }
}
