import 'dart:io';

String getFixture(name) {
  return File('test/fixtures/data/$name.json').readAsStringSync();
}
