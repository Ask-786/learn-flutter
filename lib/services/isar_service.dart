import 'package:first_project/collections/persons.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService extends ChangeNotifier {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  static ValueNotifier<List<Persons>> personsValueNotifier = ValueNotifier([]);

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
          name: 'test_db',
          [PersonsSchema],
          directory: dir.path,
          inspector: true);
    }

    return await Future.value(Isar.getInstance('test_db'));
  }

  Future<void> createPerson(Persons person) async {
    final isar = await db;
    await isar.writeTxn(() => isar.persons.put(person));
    personsValueNotifier.value.add(person);
    personsValueNotifier.notifyListeners();
  }

  Future<void> getPersons() async {
    final isar = await db;
    final persons = await isar.persons.where().findAll();
    if (personsValueNotifier.value.isEmpty) {
      personsValueNotifier.value.addAll(persons);
      personsValueNotifier.notifyListeners();
    }
  }

  Future deletePerson(Id id) async {
    final isar = await db;
    final result =
        await isar.writeTxn(() async => await isar.persons.delete(id));
    if (result) {
      final index =
          personsValueNotifier.value.indexWhere((element) => element.id == id);
      personsValueNotifier.value.removeAt(index);
      personsValueNotifier.notifyListeners();
    }
  }

  Future<void> updatePerson(Id id, String? name, String? designation) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final person = await isar.persons.get(id);
      if (person != null) {
        person.name = name ?? person.name;
        person.designation = designation ?? person.designation;
        await isar.persons.put(person);
        final index = personsValueNotifier.value
            .indexWhere((element) => element.id == id);
        personsValueNotifier.value[index] = person;
        personsValueNotifier.notifyListeners();
      }
    });
  }
}
