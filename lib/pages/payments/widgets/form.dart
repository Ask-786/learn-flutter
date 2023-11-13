import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentsFormWidget extends StatelessWidget {
  PaymentsFormWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  final _formControllers = {
    'amount': TextEditingController(),
    'description': TextEditingController(),
    'status': TextEditingController(),
    'to': TextEditingController(),
    'date': TextEditingController(),
    'time': TextEditingController(),
    'type': TextEditingController(),
    'from': TextEditingController(),
    'source': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: _formControllers['amount'],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Amount'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formControllers['description'],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Description'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formControllers['status'],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Status'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formControllers['to'],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'To'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formControllers['date'],
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    final date = await openDatePicker(context);
                    if (date != null) {
                      _formControllers['date']!.text =
                          DateFormat('yyyy-MM-dd').format(date);
                      _formControllers['time']!.text =
                          DateFormat.jm().format(date);
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Date'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formControllers['type'],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Type'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formControllers['from'],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'From'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formControllers['source'],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Source'),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'This field is required'
                      : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, '/payments/payments-details',
                            arguments: _formControllers);
                      }
                    },
                    child: const Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> openDatePicker(BuildContext context) async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2029));
  }
}
