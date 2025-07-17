class Todo {
  final String date;
  bool isComplete;
  final String todo;

  Todo({
    required this.date,
    required this.isComplete,
    required this.todo,
  });

  Todo copyWith({String? date, bool? isComplete, String? todo}) {
    return Todo(
      date: date ?? this.date,
      isComplete: isComplete ?? this.isComplete,
      todo: todo ?? this.todo,
    );
  }
}