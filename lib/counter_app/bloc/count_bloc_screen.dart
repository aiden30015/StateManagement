import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/counter_app/bloc/count_bloc.dart';
import 'package:state_management/counter_app/bloc/count_event.dart';

class CountBlocScreen extends StatelessWidget {
  const CountBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountBloc(),
      child: Scaffold(
        body: BlocBuilder<CountBloc,int>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$state',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CountBloc>().add(PlusEvent());
                        }, 
                        child: Text('+'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CountBloc>().add(MinusEvent());
                        }, 
                        child: Text('-'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          ),
      ),
    );
  }
}