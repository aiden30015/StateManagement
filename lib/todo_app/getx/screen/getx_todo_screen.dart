import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:state_management/todo_app/getx/getx/todo_getx.dart';
import 'package:state_management/todo_app/widgets/add_todo_dialog.dart';
import 'package:state_management/todo_app/widgets/todo_list.dart';

class GetxTodoScreen extends StatelessWidget {
  const GetxTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String formatDate = DateFormat('M월 d일 EEEE').format(now);
    final todoController = Get.put(TodoGetx());

    String formatTimeOfDayToAmPm(TimeOfDay time) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      final formatted = DateFormat('hh:mma').format(dt).toLowerCase(); 
      return formatted;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx( () =>Column(
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
                        '${todoController.todoList.length}개의 할일',
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
                      final selectTime = formatTimeOfDayToAmPm(result[1]);
                      if (result != null) {
                        todoController.addTodo(result[0], selectTime);
                      }
                    },
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    final selectTodo = todoController.todoList[index];

                    return Dismissible(
                      key: ValueKey(selectTodo.isComplete),
                      onDismissed: (direction) {
                        todoController.DeleteTodo(index);
                      },
                      child: TodoList(
                        isCompleted: selectTodo.isComplete,
                        onChecked: () {
                          todoController.CompleteTodo(index);
                        },
                        todo: selectTodo.todo,
                        time: selectTodo.date,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
