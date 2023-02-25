import 'package:food_frenzy/models/food_model.dart';

class CartModel {
  FoodModel food;
  int count;

  CartModel({required this.food, required this.count});

  void increment(int quantity) {
    count = count + quantity;
  }

  void decrement() {
    count--;
  }
}
