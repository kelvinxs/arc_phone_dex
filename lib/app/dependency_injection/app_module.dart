import 'dart:io';

import 'package:arc_phone_dex/app/environment/api_environment.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:localstorage/localstorage.dart';
import 'package:universal_io/io.dart' as uio;

@module
abstract class AppModule {
  @preResolve
  @singleton
  Future<Dio> dio(ApiEnvironment apiEnvironment) async =>
      await _provideDio(apiEnvironment);

  @singleton
  Future<LocalStorage> localStorage() async {
    final ls = LocalStorage("arc_phone_dex_data.json");
    while ((await ls.ready) == false) {}
    return ls;
  }

  static Future<Dio> _provideDio(ApiEnvironment environment) async {
    final dio = Dio()
      ..options.baseUrl = environment.url
      ..options.connectTimeout = 60000
      ..options.receiveTimeout = 60000
      ..options.baseUrl = environment.url
      // ..interceptors.add(MockApiForStoreReviewInterceptor())
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // final localStorage = kGetIt.get<AppLocalStorage>();
            // final account = await localStorage.getCurrentAccount();
            // if (account != null) {
            //   options.headers.putIfAbsent('Authorization', () => account.token);
            // }
            //
            // options.headers.putIfAbsent(
            //   'Accept-Language',
            //   () => uio.Platform.localeName.replaceAll("_", "-"),
            // );
            //
            // return handler.next(options);
          },
          onResponse: (response, handler) async {
            if (response.data == null || response.data == "") {
              response.data = <String, dynamic>{};
            }
            return handler.next(response);
          },
          // onError: (dioError, handler) async {
          //   if (dioError.response != null) {
          //     if (dioError.response?.statusCode == HttpStatus.unauthorized) {
          //       requisicaoInterceptada.sink.add(ApiResponse.disconnect());
          //     }
          //     if (dioError.response?.statusCode == HttpStatus.forbidden) {
          //       requisicaoInterceptada.sink
          //           .add(ApiResponse.forcePrivacyPolicy());
          //     }
          //   }
          //
          //   return handler.next(dioError);
          // },
        ),
      )
      ..interceptors.add(LogInterceptor(
        request: environment is! ProdApiEnvironment,
        responseBody: environment is! ProdApiEnvironment,
        requestBody: environment is! ProdApiEnvironment,
        requestHeader: environment is! ProdApiEnvironment,
        error: environment is! ProdApiEnvironment,
        responseHeader: environment is! ProdApiEnvironment,
      ));

    if (environment is! ProdApiEnvironment) {
      if(!kIsWeb){
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            return true;
          };
        };
      }
    }
    return dio;
  }
}
