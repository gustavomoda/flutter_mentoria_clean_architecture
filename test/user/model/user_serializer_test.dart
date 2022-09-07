import 'package:flutter_test/flutter_test.dart';
import 'package:mentoria_clean_architecture/features/login/data/model/user.dart';

void main() {
  group("Test serialize users", () {
    test("Test serialize user", () {
      final actual = User.fromJson({});
      // TODO: Implement tests
      expect(actual, false);
    });
  });
}
