import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
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
}
