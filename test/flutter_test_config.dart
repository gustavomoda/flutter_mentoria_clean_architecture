// Create test aoo and wrap widget for testing proposes
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fixtures/fakers/users/user_faker.dart';
import 'injector.dart';

MaterialApp createTestApp(Widget widget) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test APP',
      home: widget,
    );

// Create test executable for all tests
Future<void> testExecutable(FutureOr<void> testMain) async {
  final injector = configureTestDependencies();

  // register fakers
  final faker = injector.get<Faker>();
  final userEmailFaker = UserEmailFaker(injector.get<Faker>());
  injector.registerSingleton<Dio>(
    Dio(), // TODO: Mock
    instanceName: 'dioMock',
    signalsReady: true,
  );
  injector.registerSingleton<Faker>(faker);
  injector.registerSingleton<UserEmailFaker>(userEmailFaker);
  injector.registerSingleton<UserFaker>(UserFaker(faker, userEmailFaker));

  // Wait init lazy injector
  await injector.allReady();

  // Execute once before all tests
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    print('Execute once before all tests');
  });

  // execute before run each test
  setUp(() {
    // TODO: reset mocks
    // TODO: Clean caches and database
    print('Execute before run each test');
  });
}
