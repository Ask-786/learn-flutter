import 'package:flutter/material.dart';

import 'widgets/form.dart';
import 'widgets/list.dart';

class PersonsWidget extends StatelessWidget {
  const PersonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Persons'),
      ),
      body: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const PersonsFormWidget(mode: Mode.create),
        ])),
        ListWidget(),
      ]),
    ));
  }
}
