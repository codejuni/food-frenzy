import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_frenzy/models/food_model.dart';
import 'package:food_frenzy/pages/details/details_page.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.pageController,
    required this.index,
    required this.model,
    required this.indexPage,
  });

  final PageController pageController;
  final int index;
  final int indexPage;
  final FoodModel model;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double angle = 0.0;
        double radius = 0.0;
        double delta = 0.0;

        double currentPage = 0.0;
        delta = (index - currentPage);
        angle = delta * (2 * pi / 6.2);
        radius = MediaQuery.of(context).size.width * 0.3;
        if (pageController.position.haveDimensions) {
          double currentPage = pageController.page ?? 0.0;
          delta = (index - currentPage);
          angle = delta * (2 * pi / 6.2);
          radius = MediaQuery.of(context).size.width * 0.3;
        }
        return Transform.rotate(
          angle: angle,
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset(
              radius * sin(angle),
              0,
            ),
            child: Transform.scale(
              scale: index == indexPage ? 1.5 : 0.6,
              alignment: Alignment.center,
              child: Hero(
                tag: model.image,
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
                  child: Center(
                    child: Image.asset(
                      model.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
