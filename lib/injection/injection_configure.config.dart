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
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../domain/repository/base_repository_abstract.dart' as _i6;
import '../network_layer/dio_client.dart' as _i3;
import '../network_layer/retofit_layer/rest_client.dart' as _i5;

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
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModules.prefs,
      preResolve: true,
    );
    gh.singleton<_i5.ApiClientRetrofit>(
        registerModules.apiRetrofit(gh<_i3.DioClient>()));
    return this;
  }
}

class _$RegisterModules extends _i6.RegisterModules {}
