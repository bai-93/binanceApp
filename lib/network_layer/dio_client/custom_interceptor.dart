import 'package:dio/dio.dart';

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
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String newToken = await refreshToken();
    }
    handler.next(err);
  }

  Future<String> refreshToken() async {
    Dio tokenDio = Dio();
    BaseOptions options = BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        baseUrl: '');
        tokenDio.options = options;
    return '';
  }
}
