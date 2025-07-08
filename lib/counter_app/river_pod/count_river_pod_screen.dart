import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/counter_app/button.dart';
import 'package:state_management/counter_app/river_pod/count_river_pod.dart';

class CountRiverPodScreen extends ConsumerWidget {
  const CountRiverPodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(countStateRiverpod);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Button(
                  operators: '+', 
                  onPressed: () => ref.read(countStateRiverpod.notifier).plus(),
                ),
                Button(
                  operators: '-', 
                  onPressed: () => ref.read(countStateRiverpod.notifier).minus(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}