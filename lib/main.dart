import 'package:flutter/material.dart';
import 'package:state_management/counter_app/bloc/count_bloc_screen.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountBlocScreen(),
    );
  }
}