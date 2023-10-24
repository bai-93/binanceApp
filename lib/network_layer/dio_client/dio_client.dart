import 'package:dio/dio.dart';
import 'package:sheker/network_layer/dio_client/custom_interceptor.dart';

class DioClient {
  final Dio dio = configure();

  static Dio configure() {
    BaseOptions options = BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(DioClientInterceptor(dio));
    dio.interceptors.add(LogInterceptor());
    return dio;
  }
}
