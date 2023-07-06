import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_project/services/Models/api_response.dart';
import 'package:first_project/services/models/username_error_response.dart';

class PersonsService {
  final dio = Dio();

  PersonsService() {
    dio.options = BaseOptions(
      baseUrl: 'https://staging.api.ocw.sebipay.com/api/v4',
    );
  }

  Future<ApiResponse> validateUserName(String username) async {
    final body = FormData.fromMap({'username': username});
    try {
      final r = await dio.post('/user-name-suggestion', data: body);
      return ApiResponse.fromJson(r.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response!.data != null) {
        final UsernameErrorResponse error =
            UsernameErrorResponse.fromJson(e.response?.data);
        throw HttpException(error.errorMsg ?? 'Something went wrong!!');
      }
      throw const HttpException("Something went wrong!!");
    }
  }
}
