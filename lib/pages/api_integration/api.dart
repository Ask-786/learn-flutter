import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/persons_service.dart';

enum ResponseType { success, failure, loading }

class ApiIntegrationWidget extends StatefulWidget {
  const ApiIntegrationWidget({super.key});

  @override
  State<ApiIntegrationWidget> createState() => _ApiIntegrationWidgetState();
}

class _ApiIntegrationWidgetState extends State<ApiIntegrationWidget> {
  final _usernameController = TextEditingController();
  final _dioService = PersonsService();

  final _formFieldKey = GlobalKey<FormState>();
  bool statusStat = false;
  ResponseType type = ResponseType.success;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Validate Username'),
      ),
      body: Form(
        key: _formFieldKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Invalid Input";
                }
                return null;
              },
              onChanged: (value) {
                if (value == '') {
                  setState(() {
                    statusStat = false;
                  });
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
            const SizedBox(
              height: 3,
            ),
            statusStat == true
                ? _StatusWidget(
                    type: type,
                    message: message,
                  )
                : const SizedBox(),
            TextButton(
                onPressed: () {
                  onPressButton(context);
                },
                child: const Text('Validate'))
          ]),
        ),
      ),
    ));
  }

  onPressButton(BuildContext context) async {
    if (_formFieldKey.currentState!.validate()) {
      setState(() {
        type = ResponseType.loading;
        message = "Loading..";
        statusStat = true;
      });
      try {
        final response =
            await _dioService.validateUserName(_usernameController.text);
        if (response.success == true) {
          setState(() {
            type = ResponseType.success;
            message = response.message ?? 'Success';
          });
        }
      } on HttpException catch (e) {
        setState(() {
          type = ResponseType.failure;
          message = e.message;
        });
      }
    }
  }
}

class _StatusWidget extends StatelessWidget {
  const _StatusWidget({required this.type, required this.message});

  final ResponseType type;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20,
      child: Row(
        children: [
          type == ResponseType.loading
              ? const SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Icon(
                  type == ResponseType.success
                      ? Icons.check_circle
                      : Icons.cancel,
                  color:
                      type == ResponseType.success ? Colors.green : Colors.red,
                  size: 16),
          const SizedBox(width: 3),
          Text(
            message,
            style: TextStyle(
              color: type == ResponseType.loading
                  ? Colors.black
                  : type == ResponseType.success
                      ? Colors.green
                      : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
