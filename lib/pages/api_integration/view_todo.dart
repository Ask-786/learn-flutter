import 'dart:io';

import 'package:first_project/services/models/todos_service.dart';
import 'package:first_project/services/models/todos/todos.dart';
import 'package:flutter/material.dart';

class ViewTodoWidget extends StatefulWidget {
  const ViewTodoWidget({super.key, required this.id});

  final String id;

  @override
  State<ViewTodoWidget> createState() => _ViewTodoWidgetState();
}

class _ViewTodoWidgetState extends State<ViewTodoWidget> {
  final _todosService = TodosSerice();

  Future<Todos>? todo;
  String errorMessage = 'No Data!!';

  @override
  void initState() {
    try {
      todo = _todosService.getSingleTodo(widget.id);
    } on HttpException catch (e) {
      errorMessage = e.message;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: todo,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Id: ${snapshot.data?.id}'),
                        Text('Title: ${snapshot.data?.title}'),
                        Text('Completed: ${snapshot.data?.completed}'),
                        Text('User Id: ${snapshot.data?.userId}')
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(errorMessage),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
