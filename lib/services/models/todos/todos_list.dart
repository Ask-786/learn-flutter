import 'package:first_project/services/models/todos/todos.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos_list.g.dart';

@JsonSerializable()
class TodosList {
  final List<Todos> todos;

  TodosList({this.todos = const []});

  factory TodosList.fromJoson(Map<String, dynamic> json) {
    return _$TodosListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TodosListToJson(this);
}
