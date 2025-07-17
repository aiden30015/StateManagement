import 'package:state_management/todo_app/entities/todo_entity.dart';

abstract class TodoState {}

class TodoListState extends TodoState {
  final List<Todo> todos;

  TodoListState({required this.todos});
}