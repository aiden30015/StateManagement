import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/instance_manager.dart';
import 'package:state_management/todo_app/getx/getx/todo_getx.dart';
import 'package:state_management/todo_app/getx/screen/getx_todo_screen.dart';

void main() {
  Get.put(TodoGetx());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetxTodoScreen(),
      ),
    );
  }
}
