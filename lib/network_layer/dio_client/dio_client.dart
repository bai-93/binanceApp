import 'package:dio/dio.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/network_layer/dio_client/custom_interceptor.dart';

class DioClient {
  final Dio dio = configure();
  final CancelToken _cancelToken = CancelToken();

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

  // Future<CryptoHistoryPriceListModel> getHistory() async {
  //   dio.get(path);
  // }
}
