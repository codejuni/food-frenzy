import 'package:food_frenzy/assets/app_icons.dart';

class FoodModel {
  String name;
  double price;
  String image;
  String detail;

  FoodModel({
    required this.name,
    required this.price,
    required this.image,
    required this.detail,
  });

  static List<FoodModel> list = [
    FoodModel(
      name: 'Grilled fillet mignon with herbs and butter',
      price: 32,
      image: AppIcons.fileteParrilla,
      detail:
          'This dish is a high-quality cut of beef, which is grilled and seasoned with aromatic herbs and butter.',
    ),
    FoodModel(
      name: 'Grilled chicken with summer salad',
      price: 23,
      image: AppIcons.polloParrilla,
      detail:
          'This dish consists of grilled chicken breast accompanied by a summer salad',
    ),
    FoodModel(
      name: 'Spaghetti Bolognese with grated Parmesan cheese',
      price: 25,
      image: AppIcons.espagueti,
      detail:
          'This dish is a classic of Italian cuisine, consisting of spaghetti pasta with a Bolognese sauce based on ground beef, tomato and herbs.',
    ),
  ];
}
