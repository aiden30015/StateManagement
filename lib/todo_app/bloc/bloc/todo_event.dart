abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent{
  final String date;
  final String todo;

  AddTodoEvent({required this.date, required this.todo});
}

class DeleteTodoEvent extends TodoEvent {
  final int index;

  DeleteTodoEvent({required this.index});
}

class CompleteTodoEvent extends TodoEvent {
  final int index;
  CompleteTodoEvent({required this.index});
}