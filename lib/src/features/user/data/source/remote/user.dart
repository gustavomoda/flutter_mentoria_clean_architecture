import 'package:dio/dio.dart';
import 'package:mentoria_clean_architecture/src/features/user/data/source/user.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/user.dart';

part 'user.g.dart';

@RestApi()
abstract class UserRemoteDataSource implements UserDataSource {
  factory UserRemoteDataSource(Dio dio) = _UserRemoteDataSource;

  @override
  @GET('/users/actives')
  Future<List<UserModel>> actives();
}
