import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/domain/repository/base_repository_abstract.dart';
import 'package:sheker/domain/repository/repository_home_page/home_page_respository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageRepostoryImpl extends BaseRepository
    implements HomePageRepository {
  @override
  Future<CryptoModelList> getListOfCrypto() async {
    return await apiClientRetrofit.getCryptoCurrencies();
  }
}
