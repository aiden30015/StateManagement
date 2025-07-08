import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:state_management/counter_app/button.dart';
import 'package:state_management/counter_app/getx/count_getx.dart';

class CountGetxScreen extends StatelessWidget {
  CountGetxScreen({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Controller>(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${controller.count}',
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
                      onPressed: controller.plus,
                    ),
                    Button(
                      operators: '-', 
                      onPressed: controller.minus,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}