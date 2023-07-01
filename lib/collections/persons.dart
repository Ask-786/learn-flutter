import "package:isar/isar.dart";

part 'persons.g.dart';

@collection
class Persons {
  Id id = Isar.autoIncrement;
  String? name;
  String? designation;
}
