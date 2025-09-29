import 'package:flutter/material.dart';

class TodoBaseScaffold extends StatelessWidget {
  final Widget child;

  const TodoBaseScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(20.0), child: child),
      ),
    );
  }
}
