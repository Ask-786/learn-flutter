// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodosList _$TodosListFromJson(Map<String, dynamic> json) => TodosList(
      todos: (json['todos'] as List<dynamic>?)
              ?.map((e) => Todos.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TodosListToJson(TodosList instance) => <String, dynamic>{
      'todos': instance.todos,
    };
