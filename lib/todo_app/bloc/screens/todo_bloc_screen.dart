import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_bloc.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_event.dart';
import 'package:state_management/todo_app/bloc/bloc/todo_state.dart';
import 'package:state_management/todo_app/widgets/add_todo_dialog.dart';
import 'package:state_management/todo_app/widgets/todo_list.dart';

class TodoBlocScreen extends StatelessWidget {
  const TodoBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String formatDate = DateFormat('M월 d일 EEEE').format(now);

    String formatTimeOfDayToAmPm(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formatted = DateFormat('hh:mma').format(dt).toLowerCase(); 
    return formatted;
    }

    return BlocProvider(
      create: (context) => TodoBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BlocBuilder<TodoBloc, TodoListState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatDate,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '${state.todos.length}개의 할일',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.blue,
                            ),
                            shape: MaterialStateProperty.all(CircleBorder()),
                          ),
                          onPressed: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (context) {
                                return AddTodoDialog();
                              },
                            );
                            if (result != null) {
                              final todoText = result[0];
                              final timeOfDay = result[1];
                              context.read<TodoBloc>().add(
                                AddTodoEvent(date: formatTimeOfDayToAmPm(timeOfDay), todo: todoText),
                              );
                            }
                          },
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ValueKey(state.todos[index].todo),
                            onDismissed: (direction) {
                              context.read<TodoBloc>().add(DeleteTodoEvent(index: index));
                            },
                            child: TodoList(
                              isCompleted: state.todos[index].inComplete,
                              onChecked: () {
                                context.read<TodoBloc>().add(
                                  CompleteTodoEvent(index: index),
                                );
                              },
                              todo: state.todos[index].todo,
                              time: state.todos[index].date,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
