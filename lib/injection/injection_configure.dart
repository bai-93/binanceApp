import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheker/injection/injection_configure.config.dart';

final getIt = GetIt.instance;

const dev = Environment('dev');
const prod = Environment('prod');

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies({Environment environment = prod}) async {
  await getIt.init(environment: environment.name);
  bool flagOfVersion = false;
  if (environment == prod) {
    flagOfVersion = true;
  } else {
    flagOfVersion = false;
  }
  getIt<SharedPreferences>().setBool('prod', flagOfVersion);
}
