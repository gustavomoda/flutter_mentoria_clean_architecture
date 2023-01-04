import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mentoria_clean_architecture/src/features/user/data/source/remote/user.dart';
import 'package:mentoria_clean_architecture/src/injector.dart';

import '../../../../../../fixtures/data/fixture.dart';
import '../../../../../../fixtures/helpers/assert_test_interceptor.dart';
import '../../../../../../flutter_test_config.dart';

void main() {
  group('User:', () {
    const usersRoot = '/users';

    group('Data source:', () {
      group('User Remote Data Source:', () {
        test('get users', () async {
          final mockDioAdapter = injector<DioAdapter>();
          final expected = jsonDecode(getFixture('users/list'));

          mockDioAdapter.onGet(
            '$usersRoot/actives',
            (server) => server.reply(HttpStatus.ok, expected),
          );
          final dio = injector<Dio>(instanceName: kTestDioMockInstanceName);

          final remoteDataSource = UserRemoteDataSource(dio);

          dio.interceptors.add(AssertTestInterceptor(assertResponse: (response, handler) {
            expect(
              response.requestOptions.path,
              '$usersRoot/actives',
              reason: 'Should call the correct endpoint',
            );
          }));

          final response = await remoteDataSource.actives();

          expect(
            response.length,
            expected.length,
            reason: 'Should return a list of users with 2 items',
          );
        });
      });
    });
  });
}
