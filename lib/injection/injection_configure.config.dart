// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../config/theme/theme_manager.dart' as _i991;
import '../domain/entities/hive_services/hive_service.dart' as _i191;
import '../domain/repository/detail_info_repository/detail_info_repository_impl.dart'
    as _i923;
import '../domain/repository/home_page_repository/home_page_repository_impl.dart'
    as _i1038;
import '../domain/usecases/history_page_usecase/get_crypto_detail_usecase.dart'
    as _i473;
import '../domain/usecases/history_page_usecase/get_history_crypto_detail_usecase.dart'
    as _i423;
import '../domain/usecases/home_page_usecase/get_crypto_list_usecase.dart'
    as _i711;
import '../network_layer/dio_client/dio_client.dart' as _i964;
import '../network_layer/retofit_layer/rest_client.dart' as _i1048;
import '../presentation/pages/tab_bar/main_part/tab_index_observable.dart'
    as _i775;
import 'dependency.dart' as _i396;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModules.prefs,
      preResolve: true,
    );
    gh.factory<_i964.DioClient>(() => registerModules.dioClient);
    gh.factory<_i923.DetailInfoRepositoryImpl>(
        () => _i923.DetailInfoRepositoryImpl());
    gh.factory<_i1038.HomePageRepostoryImpl>(
        () => _i1038.HomePageRepostoryImpl());
    gh.factory<_i711.GetCryptoListUseCaseImpl>(
        () => _i711.GetCryptoListUseCaseImpl());
    gh.factory<_i473.GetCryptoDetailUsecase>(
        () => _i473.GetCryptoDetailUsecase());
    gh.factory<_i423.GetCryptoHistoryUsecase>(
        () => _i423.GetCryptoHistoryUsecase());
    gh.singleton<_i991.ThemeManager>(() => _i991.ThemeManager());
    gh.singleton<_i191.MainHiveService>(() => _i191.MainHiveService());
    gh.singleton<_i775.TabIndexObserver>(() => _i775.TabIndexObserver());
    gh.factory<_i1048.ApiClientRetrofit>(
        () => registerModules.apiRetrofit(gh<_i964.DioClient>()));
    return this;
  }
}

class _$RegisterModules extends _i396.RegisterModules {}
