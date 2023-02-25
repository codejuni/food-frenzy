import 'package:flutter/material.dart';
import 'package:food_frenzy/assets/app_icons.dart';
import 'package:food_frenzy/pages/cart/cart_controller.dart';
import 'package:food_frenzy/pages/details/details_controller.dart';
import 'package:get/get.dart';

class DetailsPage extends GetWidget<DetailsController> {
  DetailsPage({
    Key? key,
  }) : super(key: key);

  final cartController = Get.put<CartController>(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: controller.margin.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: controller.space.value,
                          vertical: controller.margin.value,
                        ),
                        title: Text(
                          controller.model.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding:
                                    EdgeInsets.all(controller.margin.value),
                                margin: EdgeInsets.symmetric(
                                  vertical: controller.margin.value,
                                  horizontal: controller.space.value,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      controller.space.value),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
                                ),
                                child: Image.asset(
                                  AppIcons.star,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.6,
                                color: Colors.black,
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: Image.asset(
                                        AppIcons.bag,
                                        width: 20,
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => cartController.addCart(
                                        controller.model,
                                        controller.number.value,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.black38,
                                                Theme.of(context).primaryColor,
                                                Colors.black38,
                                              ],
                                            ),
                                          ),
                                          child: const Divider(
                                            height: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                controller.margin.value * 1.8,
                                          ),
                                          child: ValueListenableBuilder<int>(
                                            valueListenable: controller.number,
                                            builder: (context, value, _) {
                                              return AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                transitionBuilder:
                                                    (child, animation) {
                                                  final position =
                                                      Tween<Offset>(
                                                    begin: (controller
                                                                .previousNumber <
                                                            value)
                                                        ? (animation.status ==
                                                                AnimationStatus
                                                                    .completed)
                                                            ? const Offset(0, 1)
                                                            : const Offset(
                                                                0, -1)
                                                        : (animation.status ==
                                                                AnimationStatus
                                                                    .completed)
                                                            ? const Offset(
                                                                0, -1)
                                                            : const Offset(
                                                                0, 1),
                                                    end: Offset.zero,
                                                  ).animate(animation);

                                                  return FadeTransition(
                                                    opacity: animation,
                                                    child: SlideTransition(
                                                      position: position,
                                                      child: child,
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  value.toString(),
                                                  key: UniqueKey(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.black38,
                                                Theme.of(context).primaryColor,
                                                Colors.black38,
                                              ],
                                            ),
                                          ),
                                          child: const Divider(
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '\$ ${controller.price.value.toStringAsFixed(2)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                (MediaQuery.of(context).size.width * 0.6),
                                0,
                                0,
                              )..scale(1.6),
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                maxRadius: MediaQuery.of(context).size.width,
                                child: Container(
                                    alignment: Alignment.centerLeft,
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
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.52,
                                              ),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        controller.space.value,
                                                      ),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(0),
                                                          Colors.black26,
                                                          Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(0),
                                                        ],
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconButton(
                                                          splashRadius: 18,
                                                          onPressed:
                                                              controller.sum,
                                                          icon: const Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                            color: Colors.black,
                                                            size: 18,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          splashRadius: 18,
                                                          onPressed:
                                                              controller.remove,
                                                          icon: const Icon(
                                                            Icons
                                                                .remove_circle_outline,
                                                            color: Colors.black,
                                                            size: 18,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Hero(
                                                      tag: controller
                                                          .model.image,
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 2,
                                                              blurRadius: 5,
                                                              offset:
                                                                  const Offset(
                                                                      0, 3),
                                                            ),
                                                          ],
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Center(
                                                          child: Image.asset(
                                                            controller
                                                                .model.image,
                                                            fit: BoxFit.cover,
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
                                        Expanded(
                                          flex: 6,
                                          child: Container(),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(controller.space.value * 1.2),
                        child: Text(
                          controller.model.detail,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
