import 'package:shared_preferences/shared_preferences.dart';
import '../../injection/injection_configure.dart';

final String _baseUrlDev = 'http://google.com';
final String _baseUrlProd = 'http://api.coincap.io/v2/';
final String baseUrl = getIt<SharedPreferences>().getBool('prod') == true
    ? _baseUrlProd
    : _baseUrlDev;
final String token = '';
