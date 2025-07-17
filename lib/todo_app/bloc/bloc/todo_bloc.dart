import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_event.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_state.dart';
import 'package:state_management/todo_app/entities/todo_entity.dart';

class TodoBloc extends Bloc<TodoEvent, TodoListState> {

  TodoBloc() : super(TodoListState(
    todos: [
      Todo(date: '7:00am', isComplete: false, todo: '아침에 걷기'),
      Todo(date: '9:30am', isComplete: false, todo: '철수 만나기'),
      Todo(date: '11:00am', isComplete: false, todo: '도미노에서 피자 사기'),
    ])) {
    on<AddTodoEvent>(AddTodo);
    on<DeleteTodoEvent>(DeleteTodo);
    on<CompleteTodoEvent>(CompleteTodo);
  }

  void AddTodo(
    AddTodoEvent event,
    Emitter<TodoListState> emit
  ) {
    final newTodo = Todo(
      date: event.date,
      isComplete: false,
      todo: event.todo,
    );
    emit(
      TodoListState(
        todos: List.from(state.todos)..add(newTodo),
      ),
    );
  }

  void DeleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoListState> emit
  ) {
    final newTodos = List<Todo>.from(state.todos)..removeAt(event.index);
    emit(TodoListState(todos: newTodos));
  }

  void CompleteTodo (
    CompleteTodoEvent event,
    Emitter<TodoListState> emit
  ) {
    final newTodos = List<Todo>.from(state.todos);
    final oldTodo = newTodos[event.index];
    newTodos[event.index] = Todo(
      date: oldTodo.date,
      isComplete: !oldTodo.isComplete,
      todo: oldTodo.todo,
    );
    emit(TodoListState(todos: newTodos));
  }
}