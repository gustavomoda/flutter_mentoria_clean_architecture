import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/model/auth.dart';
import 'package:retrofit/retrofit.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/source/login.dart';

import '../../../../../core/default_error.dart';

part 'login.g.dart';

@RestApi()
abstract class LoginRemoteDataSource implements LoginDataSource {
  factory LoginRemoteDataSource(Dio dio) = _LoginRemoteDataSource;

  @override
  @POST('/login')
  Future<Either<DefaultError, AuthModel>> login({required String username, required String secret});
}
