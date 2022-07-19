import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'app_environment.dart';

@immutable
abstract class ApiEnvironment {
  String get name;

  String get url;
}

@Singleton(env: [AppEnvironment.development], as: ApiEnvironment)
class DevApiEnvironment implements ApiEnvironment {
  @override
  String get name => AppEnvironment.development;

  @override
  String get url => "";
}

@Singleton(env: [AppEnvironment.quality], as: ApiEnvironment)
class QaApiEnvironment implements ApiEnvironment {
  @override
  String get name => AppEnvironment.quality;

  @override
  String get url => "";
}

@Singleton(env: [AppEnvironment.production], as: ApiEnvironment)
class ProdApiEnvironment implements ApiEnvironment {
  @override
  String get name => AppEnvironment.production;

  @override
  String get url => "";
}
