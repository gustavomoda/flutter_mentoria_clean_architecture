import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mentoria_clean_architecture/src/core/di.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/source/login.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/source/remote/login.dart';

@module
abstract class RegisterModule {
  @remoteDataSource
  LoginDataSource remoteLoginDataSource(Dio dio) => LoginRemoteDataSource(dio);
}
