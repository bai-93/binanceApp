import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheker/core/constants/constants.dart';
import 'package:sheker/network_layer/dio_client/dio_client.dart';
import 'package:sheker/network_layer/retofit_layer/rest_client.dart';

@module
abstract class RegisterModules {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
  @injectable
  ApiClientRetrofit apiRetrofit(DioClient dio) => ApiClientRetrofit(dio.dio,baseUrl: baseUrl);
  @injectable
  DioClient get dioClient => DioClient();
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
