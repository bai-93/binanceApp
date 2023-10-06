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

import '../network_layer/dio_client.dart' as _i3;
import '../repository/base_repository_abstract.dart' as _i5;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i3.DioClient>(() => _i3.DioClient());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModules.prefs,
      preResolve: true,
    );
    gh.factoryParam<_i5.TestRepository, String, dynamic>((
      url,
      _,
    ) =>
        registerModule.getService(url));
    return this;
  }
}

class _$RegisterModules extends _i5.RegisterModules {}

class _$RegisterModule extends _i5.RegisterModule {}
