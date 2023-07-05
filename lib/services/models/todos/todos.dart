import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Todos {
  @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'completed')
  bool? completed;

  Todos({this.userId, this.id, this.title, this.completed});

  factory Todos.fromJson(Map<String, dynamic> json) => Todos(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        completed: json['completed'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };
}
