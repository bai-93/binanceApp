import 'package:shared_preferences/shared_preferences.dart';
import '../../injection/injection_configure.dart';

final String _baseUrlDev = 'http://google.com';
final String _baseUrlProd = 'http://api.coincap.io/v2/as';
final String baseUrl = getIt<SharedPreferences>().getBool('prod') == true
    ? _baseUrlProd
    : _baseUrlDev;
final String token = '03c32504-aaa4-437c-8c0c-586fb2f7485c';
