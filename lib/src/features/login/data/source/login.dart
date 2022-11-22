import 'package:fpdart/fpdart.dart';

import '../../../../core/default_error.dart';
import '../model/auth.dart';

abstract class LoginDataSource {
  Future<Either<DefaultError, AuthModel>> login({required String username, required String secret});
}
