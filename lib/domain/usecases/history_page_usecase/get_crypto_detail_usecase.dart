import 'package:injectable/injectable.dart';
import 'package:sheker/core/usecase/usecase.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/domain/repository/detail_info_repository/detail_info_repository_impl.dart';
import 'package:sheker/injection/injection_configure.dart';

@injectable
class GetCryptoDetailUsecase
    implements UseCase<CryptoDetailModel, String, String?> {
  final DetailInfoRepositoryImpl _repositoryImpl =
      getIt<DetailInfoRepositoryImpl>();

  @override
  Future<CryptoDetailModel> call(String param, {String? second}) {
    return _repositoryImpl.getCryptoDetailInfo(param);
  }
}
