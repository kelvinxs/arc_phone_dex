import 'package:arc_phone_dex/app/app.dart';
import 'package:arc_phone_dex/app/dependency_injection/injection.dart';
import 'package:arc_phone_dex/app/environment/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



// Put --dart-define="app_environment=development|quality|production" when building to set the environment
const _environment = String.fromEnvironment("app_environment");

void main() {
  final environment = AppEnvironment.validEnvironments.firstWhere(
        (element) => element == _environment,
    orElse: () => AppEnvironment.development,
  );

  _configureApplication(environment);
}

_configureApplication(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await configureDependencies(environment);
  runApp(const ArcPhoneDex());
}
