import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_frenzy/assets/app_icons.dart';
import 'package:food_frenzy/models/cart_model.dart';
import 'package:food_frenzy/pages/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<CartController>(
          init: CartController(),
          builder: (controller) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: controller.space.value,
                    vertical: controller.margin.value,
                  ),
                  title: Text(
                    'Food Cart',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                  ),
                  trailing: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(-3),
                    child: IconButton(
                      splashRadius: 20,
                      onPressed: () => Navigator.pop(context),
                      icon: Image.asset(
                        AppIcons.arrow,
                        width: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.cart.length,
                    padding:
                        EdgeInsets.symmetric(vertical: controller.space.value),
                    /* shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(), */
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 3,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.3,
                          right: controller.space.value,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Theme.of(context).primaryColor.withOpacity(1),
                              Theme.of(context).primaryColor.withOpacity(0.8),
                              Theme.of(context).scaffoldBackgroundColor,
                            ],
                          ),
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      CartModel model = controller.cart[index];

                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          fit: StackFit.expand,
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                -((MediaQuery.of(context).size.width) * 0.45),
                                0,
                                0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(1),
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(1),
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.9),
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.7),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(
                                    controller.space.value,
                                  ),
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      model.food.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: controller.space.value,
                                      vertical: controller.space.value * 2,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          model.food.name,
                                          textAlign: TextAlign.right,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.black,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 2,
                                                ),
                                                child: Text(
                                                  model.count.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              '\$ ${model.food.price.toStringAsFixed(2)}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: controller.space.value,
                  ),
                  padding: EdgeInsets.all(
                    controller.space.value,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    children: [
                      DottedBorder(
                        borderType: BorderType.RRect,
                        strokeWidth: 1.5,
                        color: Theme.of(context).hintColor,
                        dashPattern: const [4],
                        radius: const Radius.circular(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                            vertical: controller.margin.value,
                            horizontal: controller.space.value,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Special Offers',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                height: 35,
                                width: 1.5,
                                margin: EdgeInsets.symmetric(
                                  horizontal: controller.space.value,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(1),
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      Theme.of(context).hintColor,
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(1),
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'View All',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: controller.space.value),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: controller.space.value,
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: controller.margin.value,
                            vertical: 0,
                          ),
                          title: Text(
                            'Sub Total',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          trailing: Text(
                            '\$ ${controller.subPrice.toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: controller.space.value,
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: controller.margin.value,
                          ),
                          title: Text(
                            'Tax',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          trailing: Text(
                            '\$ ${controller.tax.toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.1,
                    bottom: controller.space.value,
                    top: controller.space.value,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50),
                    ),
                  ),
                  padding: EdgeInsets.all(controller.space.value),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Proceed to Pay',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white54,
                                  ),
                            ),
                            SizedBox(height: controller.margin.value),
                            Text(
                              '\$ ${controller.totalPrice.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Colors.white,
                            ),
                            elevation: const MaterialStatePropertyAll(0),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: controller.margin.value * 1.5,
                            ),
                            child: Row(
                              children: List.generate(
                                3,
                                (index) => Opacity(
                                  opacity: (index + 2) * 0.1,
                                  child: const Icon(
                                    Icons.navigate_next_outlined,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
