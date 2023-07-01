import 'package:first_project/collections/persons.dart';
import 'package:first_project/services/isar_service.dart';
import 'package:flutter/material.dart';

enum Mode { edit, create }

class PersonsFormWidget extends StatefulWidget {
  const PersonsFormWidget({super.key, required this.mode, this.person});

  final Mode mode;

  final Persons? person;

  @override
  State<PersonsFormWidget> createState() => _PersonsFormWidgetState();
}

class _PersonsFormWidgetState extends State<PersonsFormWidget> {

  final _nameController = TextEditingController();

  final _designationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final isarService = IsarService();

  @override
  void initState() {
    setValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              createTextFormField(
                  labelText: 'Name', controller: _nameController),
              const SizedBox(height: 20),
              createTextFormField(
                  labelText: 'Designation', controller: _designationController),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final person = Persons();
                      person.name = _nameController.text;
                      person.designation = _designationController.text;

                      if (widget.mode == Mode.create) {
                        isarService
                            .createPerson(person)
                            .then((value) => {_formKey.currentState!.reset()});
                      } else if (widget.mode == Mode.edit) {
                        isarService.updatePerson(widget.person!.id,
                            _nameController.text, _designationController.text);
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text('Submit')),
            ],
          ),
        ));
  }

  setValues() {
    if (widget.mode == Mode.edit) {
      _nameController.text = widget.person!.name ?? '';
      _designationController.text = widget.person!.designation ?? '';
    }
  }

  createTextFormField(
      {required String labelText, required TextEditingController controller}) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      controller: controller,
      validator: (value) {
        if (value == null || value.length < 3) {
          return 'Please Enter a Value with atleast 3 letters';
        }
        return null;
      },
    );
  }
}
