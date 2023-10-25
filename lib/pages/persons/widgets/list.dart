import 'package:flutter/material.dart';

import '../../../collections/persons.dart';
import '../../../services/isar_service.dart';
import 'form.dart';

class ListWidget extends StatelessWidget {
  ListWidget({super.key});

  final isarService = IsarService();

  @override
  Widget build(BuildContext context) {
    isarService.getPersons();

    return ValueListenableBuilder(
        valueListenable: IsarService.personsValueNotifier,
        builder: (BuildContext valueListenableContext, List<Persons> persons,
            Widget? child) {
          return SliverList.separated(
              itemBuilder: (BuildContext valueListenableContext, int index) {
                final data = persons[index];
                return ListTile(
                  title: Text(data.name ?? ''),
                  subtitle: Text(data.designation ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          openEditDialog(valueListenableContext, data);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          isarService.deletePerson(data.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext valueListenableContext, index) {
                return const Divider();
              },
              itemCount: persons.length);
        });
  }

  openEditDialog(BuildContext context, Persons person) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Person"),
          content: SingleChildScrollView(
            child: PersonsFormWidget(
              mode: Mode.edit,
              person: person,
            ),
          ),
        );
      },
    );
  }
}
