import 'package:mentoria_clean_architecture/src/features/login/data/model/user.dart';

import '../pojo_faker.dart';

class UserFaker extends PojoFaker<User> {
  const UserFaker(super.faker, this.emailFaker);
  final UserEmailFaker emailFaker;

  @override
  User generate() => User(
      id: randomId,
      name: faker.person.name(),
      emails: emailFaker.generateList());
}

class UserEmailFaker extends PojoFaker<UserEmail> {
  const UserEmailFaker(super.faker);

  @override
  UserEmail generate() => UserEmail(
        id: randomId,
        email: faker.internet.email(),
        isMain: false,
      );
}
