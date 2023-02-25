import 'package:flutter/material.dart';
import 'package:food_frenzy/assets/app_icons.dart';
import 'package:food_frenzy/models/food_model.dart';
import 'package:food_frenzy/pages/cart/cart_controller.dart';
import 'package:food_frenzy/pages/cart/cart_page.dart';
import 'package:food_frenzy/pages/details/details_binding.dart';
import 'package:food_frenzy/pages/details/details_page.dart';
import 'package:food_frenzy/pages/home/home_controller.dart';
import 'package:food_frenzy/tiles/food_tile.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put<HomeController>(HomeController());
  final cartController = Get.put<CartController>(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => controller.isLoading.value
            ? Padding(
                padding: EdgeInsets.only(top: controller.margin),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(vertical: controller.margin),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 23),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(30),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Theme.of(context)
                                            .primaryColor
                                            .withOpacity(1),
                                        Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: controller.space,
                                          top: controller.space,
                                          bottom: controller.space,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Let`s Order',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            Text(
                                              'For Your Tummy',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      radius: 26,
                                      child: const Padding(
                                        padding: EdgeInsets.all(3),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.symmetric(
                                horizontal: controller.space * 1.4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(controller.margin * 0.5),
                              child: const Icon(
                                Icons.layers,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      margin: EdgeInsets.symmetric(
                        horizontal: controller.space,
                        vertical: controller.space,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.circular(controller.space),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: controller.space * 1.8,
                              ),
                              child: const Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: controller.space),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(1),
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0),
                                    Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .withOpacity(1),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.circular(controller.space),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: controller.space),
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    'Search Food',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: controller.space * 2,
                        left: controller.space,
                        right: controller.space,
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: controller.space),
                        title: Row(
                          children: [
                            Text(
                              'Experience',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Our Bests',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 16,
                                    wordSpacing: 2,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        trailing: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(0),
                          child: IconButton(
                            splashRadius: 20,
                            onPressed: () {},
                            icon: Image.asset(
                              AppIcons.arrow,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemCount: controller.foods.length,
                        controller: controller.pageController,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: controller.onPageChanged,
                        itemBuilder: (context, index) {
                          FoodModel model = controller.foods[index];
                          return GestureDetector(
                            onTap: () {
                              /* Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: DetailsPage(
                                        model: FoodModel.list[index],
                                      ),
                                    );
                                  },
                                ),
                              ); */
                              Get.to(
                                DetailsPage(),
                                arguments: {
                                  'food': model,
                                },
                                binding: DetailsBinding(),
                                curve: Curves.decelerate,
                                duration: const Duration(seconds: 1),
                                transition: Transition.rightToLeft,
                              );
                            },
                            child: FoodTile(
                              pageController: controller.pageController,
                              index: index,
                              model: model,
                              indexPage: controller.indexPage.value,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: controller.space),
                      child: Column(
                        children: [
                          Text(
                            FoodModel.list[controller.indexPage.value].name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(controller.margin),
                            child: Text(
                              '\$ ${FoodModel.list[controller.indexPage.value].price.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(top: controller.space),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(-3),
                              child: IconButton(
                                splashRadius: 20,
                                onPressed: controller.back,
                                icon: Image.asset(
                                  AppIcons.arrow,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(controller.space),
                                ),
                              ),
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return CartPage();
                                      },
                                    ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        AppIcons.bag,
                                        color: Colors.white,
                                        height: 25,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Hero(
                                          tag: cartController.cart.isEmpty
                                              ? ''
                                              : '${cartController.cart[cartController.cart.length - 1].food.name}/cart',
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            radius: 12,
                                            child: Text(
                                              cartController.quantityItems
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(0),
                              child: IconButton(
                                splashRadius: 20,
                                onPressed: controller.next,
                                icon: Image.asset(
                                  AppIcons.arrow,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
