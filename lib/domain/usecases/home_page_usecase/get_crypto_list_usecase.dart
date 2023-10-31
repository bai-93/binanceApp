import 'package:injectable/injectable.dart';
import 'package:sheker/core/usecase/usecase.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/domain/repository/home_page_repository/home_page_repository_impl.dart';
import 'package:sheker/domain/repository/home_page_repository/home_page_respository.dart';
import 'package:sheker/injection/injection_configure.dart';

@injectable
class GetCryptoListUseCaseImpl
    implements UseCase<CryptoModelList, void, String> {
  final HomePageRepository _repository = getIt<HomePageRepostoryImpl>();

  @override
  Future<CryptoModelList> call(void param, {String? second}) {
    return _repository.getListOfCrypto();
  }
}
