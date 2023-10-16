import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
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
    handler.next(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
