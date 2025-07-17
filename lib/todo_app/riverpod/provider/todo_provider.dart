import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/todo_app/entities/todo_entity.dart';

class TodoProvider extends StateNotifier<List<Todo>> {
  TodoProvider(this.ref) : super([]);

  final Ref ref;

  void addTodo(String todo, String date) {
    final newTodo = Todo(date: date, isComplete: false, todo: todo);
    state = [...state, newTodo];
  }

  void deleteTodo(String date, String todoText) {
    state = state.where((todo) => !(todo.date == date && todo.todo == todoText)).toList();
  }

  void isComplete(String date, String todoText) {
    state = state.map((todo) {
      if (todo.date == date && todo.todo == todoText) {
        return todo.copyWith(isComplete: !todo.isComplete);
      }
      return todo;
    }).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoProvider,List<Todo>>((ref) {
  return TodoProvider(ref);
});