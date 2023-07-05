import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ApiResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'message')
  String? message;

  ApiResponse({this.success, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json['success'] as bool?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
