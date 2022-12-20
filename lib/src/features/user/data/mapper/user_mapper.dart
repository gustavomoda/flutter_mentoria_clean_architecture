import 'package:injectable/injectable.dart';
import 'package:mentoria_clean_architecture/src/core/mapper.dart';
import 'package:mentoria_clean_architecture/src/features/login/domain/entity/user.dart';

import '../model/user.dart';

abstract class UserMapper extends MapperModelAsEntity<UserModel, UserEntity> {}

@Singleton(as: UserMapper)
class UserMapperImpl extends UserMapper {
  @override
  UserEntity toEntity(UserModel model) {
    final mainEmails = model.emails.where((element) => element.isMain);
    return UserEntity(
      id: model.id,
      name: '${model.firstName} ${model.lastName}',
      phone: model.phone,
      mainEmail: mainEmails.isNotEmpty ? mainEmails.first.email : '',
    );
  }
}
