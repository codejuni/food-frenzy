import 'package:flutter/material.dart';

class AppColors {
  static hexColor(String color) {
    String newColor = '0xff$color';
    newColor = newColor.replaceAll('#', '');
    int colorInt = int.parse(newColor);
    return colorInt;
  }

  static Color scaffold = Color(hexColor('FAFAFA'));
}
