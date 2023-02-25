import 'package:flutter/material.dart';
import 'package:food_frenzy/models/food_model.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  late FoodModel model;
  RxBool isLoading = false.obs;
  int previousNumber = 0;
  final number = ValueNotifier(1);
  RxDouble space = 15.0.obs;
  RxDouble margin = (15.0 * 0.5).obs;
  RxDouble price = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    Map<String, dynamic> map = Get.arguments;
    model = map['food'];
    price.value = model.price;
    isLoading.value = true;
  }

  void sum() {
    if (number.value == 12) return;
    previousNumber = number.value;
    number.value = previousNumber + 1;
    price.value = model.price * number.value;
  }

  void remove() {
    if (number.value == 1) return;
    previousNumber = number.value;
    number.value = previousNumber - 1;
    price.value = model.price * number.value;
  }
}
