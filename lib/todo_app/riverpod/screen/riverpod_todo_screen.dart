import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:state_management/todo_app/entities/todo_entity.dart';
import 'package:state_management/todo_app/riverpod/provider/todo_provider.dart';
import 'package:state_management/todo_app/widgets/add_todo_dialog.dart';
import 'package:state_management/todo_app/widgets/todo_appbar.dart';
import 'package:state_management/todo_app/widgets/todo_list.dart';

class RiverpodTodoScreen extends ConsumerWidget {
  const RiverpodTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var now = DateTime.now();
    String formatDate = DateFormat('M월 d일 EEEE').format(now);
    List<Todo> todo = ref.watch(todoProvider);

    String formatTimeOfDayToAmPm(TimeOfDay time) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      final formatted = DateFormat('hh:mma').format(dt).toLowerCase();
      return formatted;
    }

    Future<void> addTodo() async {
      final result = await showDialog(
        context: context,
        builder: (context) {
          return AddTodoDialog();
        },
      );
      final selectTime = formatTimeOfDayToAmPm(result[1]);
      if (result != null) {
        ref.read(todoProvider.notifier).addTodo(result[0], selectTime);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TodoAppbar(
                addTodo: addTodo,
                todoLenght: todo.length,
                formatDate: formatDate,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context, index) {
                    final todoIndex = todo[index];
                    return Dismissible(
                      key: ValueKey(todoIndex.todo),
                      onDismissed: (direction) {
                        ref
                            .read(todoProvider.notifier)
                            .deleteTodo(todoIndex.date, todoIndex.todo);
                      },
                      child: TodoList(
                        isCompleted: todoIndex.isComplete,
                        onChecked: () {
                          ref
                              .read(todoProvider.notifier)
                              .isComplete(todoIndex.date, todoIndex.todo);
                        },
                        todo: todoIndex.todo,
                        time: todoIndex.date,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
