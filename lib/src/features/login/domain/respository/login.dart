import 'package:fpdart/fpdart.dart';
import 'package:mentoria_clean_architecture/src/features/login/domain/entity/auth.dart';

import '../../../../core/default_error.dart';

abstract class LoginRepository {
  Future<Either<DefaultError, AuthEntity>> login(
      {required String username, required String secret});
}
