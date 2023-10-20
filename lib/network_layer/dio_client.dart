import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = configure();

  static Dio configure() {
    BaseOptions options = BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      receiveTimeout: const Duration(milliseconds: 15000),
      sendTimeout: const Duration(milliseconds: 15000),
      connectTimeout: const Duration(milliseconds: 15000),
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(DioClientInterceptor(dio));
    dio.interceptors.add(LogInterceptor(requestBody: true));
    return dio;
  }
}

class DioClientInterceptor extends QueuedInterceptor {
  Dio dioClient;
  DioClientInterceptor(this.dioClient);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(err.requestOptions.baseUrl);
    handler.next(err);
  }
}
