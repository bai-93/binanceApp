import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://api.coincap.io/v2/')
abstract class ApiClientRetrofit {
  factory ApiClientRetrofit(Dio dio, {String? baseUrl}) =
      _ApiClientRetrofit;

  @GET('assets')
  Future<CryptoModelList> getCryptoCurrencies();

  @GET('assets/{crypToID}')
  Future<CryptoDetailModel> getCryptoInfoById(@Path('crypToID') String cryptoID);

  @GET('assets/{cryptoID}/history')
  Future<CryptoHistoryPriceListModel> getCryptoHistoryWithInterval(
      @Path('cryptoID') String cryptoID, @Query('interval') String interval);
}
