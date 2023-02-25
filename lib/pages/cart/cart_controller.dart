import 'package:food_frenzy/models/cart_model.dart';
import 'package:food_frenzy/models/food_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CartModel> cart = <CartModel>[].obs;
  RxDouble space = 15.0.obs;
  RxDouble margin = (15.0 * 0.5).obs;
  RxInt quantityItems = 0.obs;
  RxDouble subPrice = 0.0.obs;
  RxDouble tax = 2.0.obs;
  RxDouble totalPrice = 0.0.obs;

  void getData() {
    subPrice.value = cart.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.count * element.food.price));

    totalPrice.value = subPrice.value + tax.value;
    update();
  }

  void addCart(FoodModel model, int count) {
    for (CartModel item in cart) {
      if (item.food.name == model.name) {
        item.increment(count);
        quantityItems = quantityItems + count;
        getData();
        update();
        return;
      }
    }
    cart.add(CartModel(food: model, count: count));
    quantityItems = quantityItems + count;
    getData();
    update();
  }
}
