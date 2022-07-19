// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:localstorage/localstorage.dart' as _i5;

import '../environment/api_environment.dart' as _i3;
import 'app_module.dart' as _i6;

const String _development = 'development';
const String _quality = 'quality';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.ApiEnvironment>(_i3.DevApiEnvironment(),
      registerFor: {_development});
  gh.singleton<_i3.ApiEnvironment>(_i3.QaApiEnvironment(),
      registerFor: {_quality});
  gh.singleton<_i3.ApiEnvironment>(_i3.ProdApiEnvironment(),
      registerFor: {_production});
  await gh.singletonAsync<_i4.Dio>(
      () => appModule.dio(get<_i3.ApiEnvironment>()),
      preResolve: true);
  gh.singletonAsync<_i5.LocalStorage>(() => appModule.localStorage());
  return get;
}

class _$AppModule extends _i6.AppModule {}
