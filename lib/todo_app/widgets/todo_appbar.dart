import 'package:flutter/material.dart';

class TodoAppbar extends StatelessWidget {
  final VoidCallback addTodo;
  final int todoLenght;
  final String formatDate;

  const TodoAppbar({
    super.key,
    required this.addTodo,
    required this.todoLenght,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              '$todoLenght개의 할일',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            shape: WidgetStateProperty.all(CircleBorder()),
          ),
          onPressed: () => addTodo(),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
