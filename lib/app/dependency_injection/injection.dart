import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final kGetIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String environment) async =>
    $initGetIt(kGetIt, environment: environment);
