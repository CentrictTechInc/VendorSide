import 'package:get/get.dart';

class MsgController extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update();
  }
}
