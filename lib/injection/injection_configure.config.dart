// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../domain/repository/detail_info_repository/detail_info_repository_impl.dart'
    as _i3;
import '../domain/repository/home_page_repository/home_page_repository_impl.dart'
    as _i8;
import '../domain/usecases/history_page_usecase/get_crypto_detail_usecase.dart'
    as _i5;
import '../domain/usecases/history_page_usecase/get_history_crypto_detail_usecase.dart'
    as _i6;
import '../domain/usecases/home_page_usecase/get_crypto_list_usecase.dart'
    as _i7;
import '../network_layer/dio_client/dio_client.dart' as _i4;
import '../network_layer/retofit_layer/rest_client.dart' as _i10;
import 'dependency.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.factory<_i3.DetailInfoRepositoryImpl>(
        () => _i3.DetailInfoRepositoryImpl());
    gh.factory<_i4.DioClient>(() => registerModules.dioClient);
    gh.factory<_i5.GetCryptoDetailUsecase>(() => _i5.GetCryptoDetailUsecase());
    gh.factory<_i6.GetCryptoHistoryUsecase>(
        () => _i6.GetCryptoHistoryUsecase());
    gh.factory<_i7.GetCryptoListUseCaseImpl>(
        () => _i7.GetCryptoListUseCaseImpl());
    gh.factory<_i8.HomePageRepostoryImpl>(() => _i8.HomePageRepostoryImpl());
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => registerModules.prefs,
      preResolve: true,
    );
    gh.factory<_i10.ApiClientRetrofit>(
        () => registerModules.apiRetrofit(gh<_i4.DioClient>()));
    return this;
  }
}

class _$RegisterModules extends _i11.RegisterModules {}
