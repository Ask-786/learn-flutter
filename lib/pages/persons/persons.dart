import 'package:first_project/pages/persons/widgets/form.dart';
import 'package:first_project/pages/persons/widgets/list.dart';
import 'package:flutter/material.dart';

class PersonsWidget extends StatelessWidget {
  const PersonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Persons'),
          ),
          body: SingleChildScrollView(
              child: Column(children: [
            const PersonsFormWidget(
              mode: Mode.create,
            ),
            ListWidget()
          ]))),
    );
  }
}