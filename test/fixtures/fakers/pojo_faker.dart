import 'package:faker/faker.dart';

abstract class PojoFaker<T> {
  const PojoFaker(this.faker);

  final Faker faker;

  // Generate a single fake model
  T generate();

  // Generate a list of fake models
  List<T> generateList({int? length}) {
    return List.generate(
      length ?? faker.randomGenerator.integer(100, min: 0),
      (index) => generate(),
    );
  }

  // Generate a random amount greater than or equal to one with 2 decimal places.
  double get randomAmount => faker.randomGenerator.decimal(scale: 2, min: 1);

  // Generate a random id
  int get randomId => faker.randomGenerator.integer(10000000, min: 1);
}
