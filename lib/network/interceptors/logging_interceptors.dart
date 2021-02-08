import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  int _maxCharactersPerLine = 10000;

  @override
  Future onRequest(RequestOptions options) {
    debugPrint("========================================");
    debugPrint("========================================");

    debugPrint("--> ${options.method} ${options.path}");
    debugPrint("========================================");
    debugPrint("========================================");

    debugPrint("Content type: ${options.contentType}");
    debugPrint("========================================");

    debugPrint("<-- END HTTP");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    debugPrint("========================================");
    debugPrint("========================================");

    debugPrint(
        "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");

    debugPrint("========================================");
    debugPrint("========================================");

    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        debugPrint(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      debugPrint("========================================");
      debugPrint("========================================");

      debugPrint(response.data);

      debugPrint("========================================");
      debugPrint("========================================");
    }
    debugPrint("<-- END HTTP");

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    debugPrint("<-- Error -->");
    debugPrint("========================================");
    debugPrint("========================================");

    debugPrint(err.error);
    debugPrint(err.message);

    debugPrint("========================================");
    debugPrint("========================================");

    return super.onError(err);
  }
}
