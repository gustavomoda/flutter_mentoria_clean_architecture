// Create test aoo and wrap widget for testing proposes
import 'dart:async';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:mentoria_clean_architecture/src/injector.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures/fakers/users/user_faker.dart';

const kTestDioMockInstanceName = 'dioMock';

MaterialApp createTestApp(Widget widget) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test APP',
      home: widget,
    );

// Create test executable for all tests

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  configureDependencies(Environment.test);

  // register fakers
  final faker = Faker();
  final dio = Dio()..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  final dioAdapter = DioAdapter(
    dio: dio,
    matcher: const UrlRequestMatcher(),
  );
  final userEmailFaker = UserEmailModelFaker(faker);

  injector.registerSingleton<Faker>(faker);
  injector.registerSingleton<Dio>(dio, instanceName: kTestDioMockInstanceName);
  injector.registerSingleton<DioAdapter>(dioAdapter);

  injector.registerSingleton<UserEmailModelFaker>(userEmailFaker);
  injector.registerSingleton<UserModelFaker>(UserModelFaker(
    faker,
    userEmailFaker,
  ));

  // Wait init lazy injector
  await injector.allReady();

  // Execute once before all tests
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  // execute before run each test
  setUp(() {
    dioAdapter.reset();
  });

  return testMain();
}
