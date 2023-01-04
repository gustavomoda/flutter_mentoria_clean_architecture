import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('urlApi')
  String get urlApiProd => "http://www.minhaapi.com.br";

  @singleton
  Dio dioProduction(@Named('urlApi') String url) => Dio(
        BaseOptions(baseUrl: urlApiProd),
      );
}
