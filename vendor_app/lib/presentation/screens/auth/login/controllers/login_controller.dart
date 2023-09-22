import 'package:get/get.dart';

class LoginController extends GetxController {
  final passToggle = false.obs;

  final count = 0.obs;
  increment() => count.value++;
  passwordToggle() => passToggle.toggle();
}
