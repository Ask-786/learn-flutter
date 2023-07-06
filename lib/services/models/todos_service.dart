import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_project/services/models/todos/todos.dart';
import 'package:first_project/services/models/todos/todos_list.dart';

class TodosSerice {
  final dio = Dio();

  TodosSerice() {
    dio.options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    );
  }
  Future<TodosList> getTodos() async {
    try {
      final r = await dio.get('/todos');
      final Map<String, dynamic> map = {"todos": r.data};
      return TodosList.fromJoson(map);
    } catch (e) {
      throw const HttpException("Something went wrong!!");
    }
  }

  Future<Todos> getSingleTodo(String id) async {
    try {
      final r = await dio.get('/todos/$id');
      return Todos.fromJson(r.data);
    } catch (e) {
      throw const HttpException("Something went wrong!!");
    }
  }
}
