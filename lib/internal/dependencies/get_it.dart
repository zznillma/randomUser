import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:practice43/internal/dependencies/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
  usesNullSafety: true,
)
void configureDependencies() => $initGetIt(getIt);

final locator = GetIt.instance; 