import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void tambahCounter() => counter.value++;

  void resetCounter() => counter.value = 0;
}
