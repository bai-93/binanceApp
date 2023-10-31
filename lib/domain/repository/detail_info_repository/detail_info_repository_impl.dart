import 'package:injectable/injectable.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/domain/repository/base_repository_abstract.dart';
import 'package:sheker/domain/repository/detail_info_repository/detail_info_repository.dart';

@injectable
class DetailInfoRepositoryImpl extends BaseRepository
    implements DetailInfoRepository {
  @override
  Future<CryptoDetailModel> getCryptoDetailInfo(String cryptoId) async {
    return await apiClientRetrofit.getCryptoInfoById(cryptoId);
  }

  @override
  Future<CryptoHistoryPriceListModel> getCryptoHistoryInfo(
      String cryptoId, String interval) async {
    return await apiClientRetrofit.getCryptoHistoryWithInterval(
        cryptoId, interval);
  }
}
