import 'package:get/state_manager.dart';

class Controller extends GetxController {
  int count = 0;
  
  void plus() {
    count += 1;
    update();
  }

  void minus() {
    count -= 1;
    update();
  }
}