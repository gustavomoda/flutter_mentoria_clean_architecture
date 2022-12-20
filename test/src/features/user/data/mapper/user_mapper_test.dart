import 'package:flutter_test/flutter_test.dart';
import 'package:mentoria_clean_architecture/src/features/login/domain/entity/user.dart';
import 'package:mentoria_clean_architecture/src/features/user/data/mapper/user_mapper.dart';
import 'package:mentoria_clean_architecture/src/injector.dart';

import '../../../../../fixtures/fakers/users/user_faker.dart';

void main() {
  group('User:', () {
    group('Domain:', () {
      group('Mappers:', () {
        test('With email principal', () {
          final expected =
              injector<UserModelFaker>().generateWithEmailPrincipal();
          final mapper = injector<UserMapper>();
          final actual = mapper.toEntity(expected);
          expect(actual, isA<UserEntity>());
          expect(actual.id, expected.id);
          expect(actual.name, '${expected.firstName} ${expected.lastName}');
          expect(
            actual.mainEmail,
            expected.emails.where((element) => element.isMain).first.email,
          );
        });

        test('Without email principal email should be empty', () {
          final expected = injector<UserModelFaker>().generateWithoutEmail();
          final mapper = injector<UserMapper>();
          final actual = mapper.toEntity(expected);
          expect(actual, isA<UserEntity>());
          expect(actual.mainEmail, "");
        });
      });
    });
  });
}
