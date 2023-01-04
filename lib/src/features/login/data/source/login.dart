import '../model/auth.dart';

abstract class LoginDataSource {
  Future<AuthModel> login({required String username, required String secret});
}
