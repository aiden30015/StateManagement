import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String operators;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.operators,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(operators),
      );
  }
}