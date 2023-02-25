import 'package:flutter/material.dart';
import 'package:food_frenzy/color/app_colors.dart';
import 'package:food_frenzy/pages/home/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey.shade100,
        scaffoldBackgroundColor: AppColors.scaffold,
      ),
      home: HomePage(),
    );
  }
}
