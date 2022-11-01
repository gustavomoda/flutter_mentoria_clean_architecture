abstract class LoginDataSource {
  Future<dynamic> login({required String username, required String secret});
}
