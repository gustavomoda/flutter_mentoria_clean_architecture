import 'package:flutter_test/flutter_test.dart';
import 'package:mentoria_clean_architecture/src/features/login/data/model/user.dart';
import '../../fixtures/fakers/users/user_faker.dart';
import '../../injector.dart';

void main() {
  test("The faker should be generate a new User instance", () {
    final userFaker = injector.get<UserFaker>();
    final actual = userFaker.generate();
    expect(actual, User.fromJson(actual.toJson()));
  });

  test("Test serialize user from api schema", () {
    // TODO: implement
  });
}
