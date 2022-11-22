import 'package:injectable/injectable.dart';
import 'package:mentoria_clean_architecture/src/core/mapper.dart';

import '../../domain/entity/auth.dart';
import '../model/auth.dart';

abstract class AuthMapper
    with MapperEntity<AuthEntity, AuthModel>, MapperModel<AuthModel, AuthEntity> {}

@Injectable()
@Singleton(as: AuthMapper)
class AuthMapperImpl extends AuthMapper {
  @override
  AuthEntity toEntity(AuthModel model) => AuthEntity(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        expiresIn: model.expiresIn,
      );

  @override
  AuthModel toModel(AuthEntity entity) => AuthModel(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        expiresIn: entity.expiresIn,
      );
}
