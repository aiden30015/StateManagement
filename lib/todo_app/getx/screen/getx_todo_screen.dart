import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:state_management/todo_app/core/constant/todo_base_scaffold.dart';
import 'package:state_management/todo_app/getx/getx/todo_getx.dart';
import 'package:state_management/todo_app/widgets/add_todo_dialog.dart';
import 'package:state_management/todo_app/widgets/todo_appbar.dart';
import 'package:state_management/todo_app/widgets/todo_list.dart';

class GetxTodoScreen extends StatelessWidget {
  const GetxTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String formatDate = DateFormat('M월 d일 EEEE').format(now);
    final todoController = Get.find<TodoGetx>();

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
        todoController.addTodo(result[0], selectTime);
      }
    }

    return TodoBaseScaffold(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TodoAppbar(
              addTodo: addTodo,
              todoLenght: todoController.todoList.length,
              formatDate: formatDate,
            ),
            SizedBox(height: 20),
            _buildTodoList(todoController),
          ],
        ),
      ),
    );
  }

  Widget _buildTodoList(TodoGetx todoController) {
    return ListView.builder(
      itemCount: todoController.todoList.length,
      itemBuilder: (context, index) {
        final todo = todoController.todoList[index];
        return Dismissible(
          key: ValueKey('${todo.todo}_$index'),
          onDismissed: (_) => todoController.deleteTodo(index),
          child: TodoList(
            isCompleted: todo.isComplete,
            onChecked: () => todoController.completeTodo(index),
            todo: todo.todo,
            time: todo.date,
          ),
        );
      },
    );
  }
}
