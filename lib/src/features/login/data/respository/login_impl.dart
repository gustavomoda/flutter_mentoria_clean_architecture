import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mentoria_clean_architecture/src/core/default_error.dart';
import 'package:mentoria_clean_architecture/src/core/di.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/mapper/auth_mapper.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/source/login.dart';
import 'package:mentoria_clean_architecture/src/features/login/domain/entity/auth.dart';

import '../../domain/respository/login.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl(@remoteDataSource this.remote, this.mapper);

  final LoginDataSource remote;
  final AuthMapper mapper;

  @override
  Future<Either<DefaultError, AuthEntity>> login({
    required String username,
    required String secret,
  }) async {
    final result = await remote.login(username: username, secret: secret);

    return result.fold((error) => Left(error), (model) => Right(mapper.toEntity(model)));
  }
}
