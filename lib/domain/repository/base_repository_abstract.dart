import 'package:dio/src/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/network_layer/dio_client/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheker/network_layer/retofit_layer/rest_client.dart';

abstract class BaseRepository {
  final DioClient dio = getIt<DioClient>();
  final ApiClientRetrofit apiClientRetrofit = getIt<ApiClientRetrofit>();
  final SharedPreferences prefs = getIt<SharedPreferences>();
}
