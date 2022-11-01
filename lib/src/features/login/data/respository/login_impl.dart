import 'package:mentoria_clean_architecture/src/core/di.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/source/login.dart';

class LoginRepositoryImpl {
  const LoginRepositoryImpl(
    @remoteDataSource this.remote,
    @localDataSource this.local,
  );

  final LoginDataSource remote;
  final LoginDataSource local;
}
