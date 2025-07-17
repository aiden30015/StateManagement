import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {

  bool isCompleted;
  final VoidCallback onChecked;
  final String todo;
  final String time;

  TodoList({
    required this.isCompleted,
    required this.onChecked,
    required this.todo,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Row(
        children: [
          isCompleted ? 
          IconButton(
            onPressed: onChecked, 
            icon: Icon(Icons.check_circle_outline),
          ) :
          IconButton(
            onPressed: onChecked, 
            icon: Icon(Icons.circle_outlined),
          ),
          Text(
            todo,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          Spacer(),
          Text(
            time,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey
            ), 
          )
        ],
      ),
    );
  }
}