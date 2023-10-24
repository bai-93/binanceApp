import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sheker/core/constants/constants.dart';
import 'package:sheker/network_layer/exceptions/custom_exception.dart';

class DioClientInterceptor extends QueuedInterceptor {
  int count = 0;
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
    if (err.response?.statusCode == HttpStatus.notFound ||
        err.response?.statusCode == HttpStatus.badRequest) {
      String newToken = await refreshToken();
      if (newToken.isNotEmpty) {
        handler.next(
            BadRequestException('statusMessage', 0, r: err.requestOptions));
      } else {
        final response = await retryRequest(err.requestOptions);
        if (response != null) {
          handler.resolve(response);
        } else {
          handler.next(
              NetworkException('statusMessage', null, r: err.requestOptions));
        }
      }
    } else {
      print("Something new UNEXPECTED ERROR");
      handler.next(err);
    }
  }

  Future<String> refreshToken() async {
    const String tokenField = "refreshToken";
    const String refreshToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY5Nzg3NDA5MiwiZXhwIjoxNjk3OTEwMDkyfQ.MFSU6CBuFv6blhulHhWzc-2rCZeWyQUEjwtF8vQ5rSs";
    Dio tokenDio = Dio();
    BaseOptions options = BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        baseUrl:
            'https://api.escuelajs.co/api/v1/auth/refresh-token'); // meaningless url, just for test refresh token
    tokenDio.options = options;

    return '';
  }

  Future<Response> retryRequest(RequestOptions reqOpt) {
    count++;
    final option = Options(
        method: reqOpt.method, headers: {'Authorization': 'Bearer ${token}'});
    return dioClient.request('http://api.coincap.io/v2/${reqOpt.path}',
        options: option,
        cancelToken: reqOpt.cancelToken,
        data: reqOpt.data,
        queryParameters: reqOpt.queryParameters,
        onReceiveProgress: reqOpt.onReceiveProgress,
        onSendProgress: reqOpt.onSendProgress);
  }
}
