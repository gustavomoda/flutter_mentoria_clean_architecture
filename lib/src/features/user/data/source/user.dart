import '../model/user.dart';

abstract class UserDataSource {
  Future<List<UserModel>> actives();
}
