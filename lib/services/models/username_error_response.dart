import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UsernameErrorResponse {
  bool? success;
  String? errorMsg;

  UsernameErrorResponse({this.success, this.errorMsg});

  factory UsernameErrorResponse.fromJson(Map<String, dynamic> json) {
    return UsernameErrorResponse(
      success: json['success'] as bool?,
      errorMsg: json['errorMsg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'errorMsg': errorMsg,
      };
}
