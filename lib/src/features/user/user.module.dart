import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mentoria_clean_architecture/src/core/di.dart';
import 'package:mentoria_clean_architecture/src/features/user/data/source/user.dart';

import 'data/source/remote/user.dart';

@module
abstract class UserRegisterModule {
  @remoteDataSource
  UserDataSource remoteLoginDataSource(Dio dio) => UserRemoteDataSource(dio);
}
