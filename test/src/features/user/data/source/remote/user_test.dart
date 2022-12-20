import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mentoria_clean_architecture/src/features/user/data/source/remote/user.dart';

void main() {
  group('User:', () {
    group('Data source:', () {
      group('User Remote Data Source:', () {
        test('get users', () {
          final remoteDataSource = UserRemoteDataSource(Dio());
          // TODO: Implement test and source
          expect(true, false);
        });
      });
    });
  });
}
