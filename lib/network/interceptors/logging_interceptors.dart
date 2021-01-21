import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  int _maxCharactersPerLine = 10000;

  @override
  Future onRequest(RequestOptions options) {
    print("========================================");
    print("========================================");

    print("--> ${options.method} ${options.path}");
    print("========================================");
    print("========================================");

    print("Content type: ${options.contentType}");
    print("========================================");

    print("<-- END HTTP");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("========================================");
    print("========================================");

    print(
        "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");

    print("========================================");
    print("========================================");

    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      print("========================================");
      print("========================================");

      print(response.data);

      print("========================================");
      print("========================================");
    }
    print("<-- END HTTP");

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("<-- Error -->");
    print("========================================");
    print("========================================");

    print(err.error);
    print(err.message);

    print("========================================");
    print("========================================");

    return super.onError(err);
  }
}
