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
    return dio;
  }
}

class DioClientInterceptor extends Interceptor {
  Dio dioClient;
  DioClientInterceptor(this.dioClient);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('request is OnRequest');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('request is Response');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('request is OnError');
    handler.next(err);
  }
}
