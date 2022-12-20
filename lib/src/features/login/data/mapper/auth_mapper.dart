import 'package:injectable/injectable.dart';
import 'package:mentoria_clean_architecture/src/core/mapper.dart';

import '../../domain/entity/auth.dart';
import '../model/auth.dart';

abstract class AuthMapper
    with
        MapperModelAsEntity<AuthModel, AuthEntity>,
        MapperEntityAsModel<AuthEntity, AuthModel> {}

@Singleton(as: AuthMapper)
class AuthMapperImpl extends AuthMapper {
  @override
  AuthEntity toEntity(AuthModel model) => AuthEntity(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        expiresIn: model.expiresIn,
      );

  @override
  AuthModel toModel(AuthEntity model) => AuthModel(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        expiresIn: model.expiresIn,
      );
}
