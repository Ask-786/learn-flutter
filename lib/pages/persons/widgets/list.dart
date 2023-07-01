import 'package:first_project/collections/persons.dart';
import 'package:first_project/services/isar_service.dart';
import 'package:first_project/pages/persons/widgets/form.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final isarService = IsarService();

  @override
  Widget build(BuildContext context) {
    isarService.getPersons();

    return ValueListenableBuilder(
        valueListenable: IsarService.personsValueNotifier,
        builder: (BuildContext ctx, List<Persons> persons, Widget? child) {
          return ListView.separated(
              physics: const PageScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int index) {
                final data = persons[index];
                return ListTile(
                  title: Text(data.name ?? ''),
                  subtitle: Text(data.designation ?? ''),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                        onPressed: () {
                          openEditDialog(ctx, data);
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          isarService.deletePerson(data.id);
                        },
                        icon: const Icon(Icons.delete)),
                  ]),
                );
              },
              separatorBuilder: (BuildContext ctx, index) {
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
        });
  }
}
