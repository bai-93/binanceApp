import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sheker/domain/repository/cryptoModel/list_crypto_currencies_model.dart';
import '../../domain/repository/cryptoModel/crypto_history_price_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://api.coincap.io/v2/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('assets')
  Future<CryptoModel> getCryptoCurrencies();

  @GET('assets/{crypToID}')
  Future<CryptoModelList> getCryptoInfoById(@Path('crypToID') String cryptoID);

  @GET('assets/{cryptoID}/history')
  Future<CryptoHistoryPriceListModel> getCryptoHistoryWithInterval(
      @Path('cryptoID') String cryptoID, @Query('interval') String interval);
}
