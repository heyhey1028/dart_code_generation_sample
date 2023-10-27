import 'package:annotations/annotations.dart';

part 'person.json_builder.g.dart';

@jsonGen
class Person {
  final String name;
  final String lastName;
  final bool isAdult;
  final int age;

  const Person({
    required this.name,
    required this.lastName,
    required this.isAdult,
    required this.age,
  });
}
