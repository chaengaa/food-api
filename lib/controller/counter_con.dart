// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class CounterQty extends GetxController {
  var count = 0.obs;

  void Increment() {
    count.value++;
  }

  void Decrement() {
    if (count.value > 0) {
      count.value--;
    }
  }
  void reset() {
    count.value = 0;
  }
}
