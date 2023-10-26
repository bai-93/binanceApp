import 'package:injectable/injectable.dart';
import 'package:sheker/core/usecase/usecase.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/domain/repository/base_repository_abstract.dart';
import 'package:sheker/domain/repository/repository_home_page/home_page_repository_impl.dart';

abstract class HomePageRepository {
  Future<CryptoModelList> getListOfCrypto();
}
