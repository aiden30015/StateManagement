import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_bloc.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_event.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_state.dart';
import 'package:state_management/todo_app/core/constant/todo_base_scaffold.dart';
import 'package:state_management/todo_app/widgets/add_todo_dialog.dart';
import 'package:state_management/todo_app/widgets/todo_appbar.dart';
import 'package:state_management/todo_app/widgets/todo_list.dart';

class TodoBlocScreen extends StatelessWidget {
  const TodoBlocScreen({super.key});

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('hh:mma').format(dt).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatDate = DateFormat('M월 d일 EEEE').format(now);

    return BlocProvider(
      create: (_) => TodoBloc(),
      child: Builder(
        builder: (context) {
          Future<void> addTodo() async {
            final result = await showDialog(
              context: context,
              builder: (_) => const AddTodoDialog(),
            );

            if (result == null || result.length < 2) return;

            final todoText = result[0];
            final selectTime = _formatTimeOfDay(result[1]);

            context.read<TodoBloc>().add(
              AddTodoEvent(date: selectTime, todo: todoText),
            );
          }

          return TodoBaseScaffold(
            child: BlocBuilder<TodoBloc, TodoListState>(
              builder: (context, state) {
                return Column(
                  children: [
                    TodoAppbar(
                      addTodo: addTodo,
                      todoLenght: state.todos.length,
                      formatDate: formatDate,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          final todo = state.todos[index];

                          return Dismissible(
                            key: ValueKey(todo.todo),
                            onDismissed: (_) => context.read<TodoBloc>().add(
                              DeleteTodoEvent(index: index),
                            ),
                            child: TodoList(
                              isCompleted: todo.isComplete,
                              onChecked: () => context.read<TodoBloc>().add(
                                CompleteTodoEvent(index: index),
                              ),
                              todo: todo.todo,
                              time: todo.date,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
