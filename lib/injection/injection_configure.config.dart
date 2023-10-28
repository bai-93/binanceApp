// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../domain/repository/repository_home_page/home_page_repository_impl.dart'
    as _i5;
import '../domain/usecases/home_page_usecase/get_crypto_list_usecase.dart'
    as _i4;
import '../network_layer/dio_client/dio_client.dart' as _i3;
import '../network_layer/retofit_layer/rest_client.dart' as _i7;
import 'dependency.dart' as _i8;

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
    gh.factory<_i3.DioClient>(() => registerModules.dioClient);
    gh.factory<_i4.GetCryptoListUseCaseImpl>(
        () => _i4.GetCryptoListUseCaseImpl());
    gh.factory<_i5.HomePageRepostoryImpl>(() => _i5.HomePageRepostoryImpl());
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => registerModules.prefs,
      preResolve: true,
    );
    gh.factory<_i7.ApiClientRetrofit>(
        () => registerModules.apiRetrofit(gh<_i3.DioClient>()));
    return this;
  }
}

class _$RegisterModules extends _i8.RegisterModules {}
