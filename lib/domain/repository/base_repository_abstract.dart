import 'package:dio/src/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/network_layer/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheker/network_layer/retofit_layer/rest_client.dart';

abstract class BaseRepository {
  final DioClient dio = getIt<DioClient>();
  final SharedPreferences prefs = getIt<SharedPreferences>();
}

@module
abstract class RegisterModules {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
  @singleton
  ApiClientRetrofit apiRetrofit(DioClient dio) => ApiClientRetrofit(dio.dio);

  @singleton
  DioClient get dioClient => DioClient();
}

class Repository extends BaseRepository { // CASE extends not required to override, only in IMPLEMENTS we have to override
}

// @module
// abstract class RegisterModule {
//   TestRepository getService(@factoryParam String url) => TestRepository(url);
// }

// class TestRepository extends BaseRepository {
//   String url;
//   TestRepository(this.url);
//   void testData() {
//     print('url === ${url}');
//     print(prefs != null);
//     print(dio != null);
//   }
// }
