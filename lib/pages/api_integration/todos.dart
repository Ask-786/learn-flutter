import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/models/todos/todos_list.dart';
import '../../services/models/todos_service.dart';
import 'view_todo.dart';

class TodosWidget extends StatefulWidget {
  const TodosWidget({super.key});

  @override
  State<TodosWidget> createState() => _TodosWidgetState();
}

class _TodosWidgetState extends State<TodosWidget> {
  final _todoService = TodosSerice();

  Future<TodosList>? todos;
  String errorMsg = 'No Data!!';

  @override
  void initState() {
    try {
      todos = _todoService.getTodos();
    } on HttpException catch (e) {
      errorMsg = e.message;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: FutureBuilder(
        future: todos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data?.todos != null) {
              return ListView.separated(
                itemCount: snapshot.data?.todos.length ?? 0,
                itemBuilder: (context, index) {
                  final todo = snapshot.data?.todos[index];
                  return ListTile(
                    tileColor: todo?.completed == true
                        ? Colors.green[50]
                        : Colors.red[50],
                    title: Text(todo?.title ?? 'Dummy Title'),
                    subtitle: Text(todo?.completed == true
                        ? 'Completed'
                        : 'Not Completed'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewTodoWidget(
                                id: todo?.id.toString() ?? '',
                              )));
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 2,
                  thickness: 0.5,
                  color: Colors.black,
                ),
              );
            } else {
              return Text(errorMsg);
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
