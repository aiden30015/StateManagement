import 'package:get/get.dart';
import 'package:state_management/todo_app/entities/todo_entity.dart';

class TodoGetx extends GetxController {
  var todoList = <Todo>[].obs;

  void addTodo(String todo, String date) {
    todoList.add(Todo(date: date, isComplete: false, todo: todo));
    update();
  }

  void DeleteTodo(int index) {
    todoList.removeAt(index);
    update();
  }

  void CompleteTodo(int index) {
    todoList[index].isComplete = !todoList[index].isComplete;
    update();
  }
}