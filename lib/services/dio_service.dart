import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_project/services/Models/api_response.dart';
import 'package:first_project/services/models/todos/todos.dart';
import 'package:first_project/services/models/todos/todos_list.dart';

class IApiRes<T> {
  final bool success;
  final T message;

  IApiRes(this.success, this.message);
}

class DioService {
  final dio = Dio();
  final rootUrl = 'https://staging.api.ocw.sebipay.com/api/v4';

  Future<ApiResponse> validateUserName(String username) async {
    final body = FormData.fromMap({'username': username});
    try {
      final r = await dio.post('$rootUrl/user-name-suggestion', data: body);
      return ApiResponse.fromJson(r.data);
    } on DioException catch (e) {
      throw HttpException(
          e.response?.data['errorMsg'] ?? 'Something went wrong!!');
    }
  }

  Future<TodosList> getTodos() async {
    const rootUrl = 'https://jsonplaceholder.typicode.com';

    try {
      final r = await dio.get('$rootUrl/todos');
      final Map<String, dynamic> map = {"todos": r.data};
      return TodosList.fromJoson(map);
    } catch (e) {
      throw Exception(e);
    }
  }
}
