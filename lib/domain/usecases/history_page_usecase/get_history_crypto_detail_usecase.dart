import 'package:injectable/injectable.dart';
import 'package:sheker/core/usecase/usecase.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/domain/repository/detail_info_repository/detail_info_repository_impl.dart';
import 'package:sheker/injection/injection_configure.dart';

@injectable
class GetCryptoHistoryUsecase
    implements UseCase<CryptoHistoryPriceListModel, String, String> {
  final DetailInfoRepositoryImpl _repositoryImpl =
      getIt<DetailInfoRepositoryImpl>();

  @override
  Future<CryptoHistoryPriceListModel> call(String param,
      {String? second = ""}) {
    return _repositoryImpl.getCryptoHistoryInfo(param, second!);
  }
}
