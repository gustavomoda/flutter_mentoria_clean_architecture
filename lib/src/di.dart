import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @prod
  @Named('urlApi')
  String get urlApiProd => "http://www.minhaapi.com.br";

  @dev
  @Named('urlApi')
  String get urlApiDev => "http://localhost:8080";

  @prod
  @singleton
  Dio dioProduction(@Named('urlApi') String url) => Dio(
        BaseOptions(baseUrl: urlApiProd),
      );

  @dev
  @singleton
  Dio dioDev(@Named('urlApi') String url) => Dio(
        BaseOptions(baseUrl: urlApiProd),
      );
}
