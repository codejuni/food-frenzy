import 'package:flutter/material.dart';
import 'package:food_frenzy/models/food_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  double space = 15;
  double margin = 15 * 0.5;
  RxInt indexPage = 0.obs;
  late PageController pageController;
  RxBool isLoading = false.obs;
  RxList<FoodModel> foods = <FoodModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void getData() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        pageController = PageController(
          initialPage: 0,
          viewportFraction: 0.4,
        );
        foods.value = FoodModel.list;
        isLoading.value = true;
      },
    );
  }

  void onPageChanged(int value) {
    indexPage.value = value;
  }

  void next() {
    if (indexPage.value == (foods.length - 1)) return;
    pageController.animateToPage(
      indexPage.value + 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }

  void back() {
    if (indexPage.value == 0) return;

    pageController.animateToPage(
      indexPage.value - 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }
}
