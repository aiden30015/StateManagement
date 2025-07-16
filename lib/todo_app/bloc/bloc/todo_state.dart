abstract class TodoState {}

class Todo {
  final String date;
  final bool inComplete;
  final String todo;

  Todo({
    required this.date,
    required this.inComplete,
    required this.todo,
  });
}

class TodoListState extends TodoState {
  final List<Todo> todos;

  TodoListState({required this.todos});
}