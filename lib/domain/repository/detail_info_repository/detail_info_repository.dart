import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';

abstract class DetailInfoRepository {
  Future<CryptoDetailModel> getCryptoDetailInfo(String cryptoId);
  Future<CryptoHistoryPriceListModel> getCryptoHistoryInfo(
      String cryptoId, String interval);
}
