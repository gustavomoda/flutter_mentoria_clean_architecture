import 'package:mentoria_clean_architecture/src/features/user/data/model/user.dart';

import '../pojo_faker.dart';

class UserModelFaker extends PojoFaker<UserModel> {
  const UserModelFaker(super.faker, this.emailFaker);
  final UserEmailModelFaker emailFaker;

  @override
  UserModel generate() => UserModel(
      id: randomId,
      firstName: faker.person.name(),
      lastName: faker.person.lastName(),
      phone: faker.phoneNumber.us(),
      emails: emailFaker.generateList());

  UserModel generateWithEmailPrincipal() => generate().copyWith(
        emails: [
          emailFaker.generate().copyWith(isMain: true),
          emailFaker.generate().copyWith(isMain: false),
          emailFaker.generate().copyWith(isMain: false),
        ],
      );
  UserModel generateWithoutEmail() => generate().copyWith(
        emails: [],
      );
}

class UserEmailModelFaker extends PojoFaker<UserEmail> {
  const UserEmailModelFaker(super.faker);

  @override
  UserEmail generate() => UserEmail(
        id: randomId,
        email: faker.internet.email(),
        isMain: false,
      );
}
