import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/model/home_sport_categories_model.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:flutter/material.dart';

class BookingViewModel extends BaseViewModel {
  List<SportCategoriesModel> sportCategoriesList = [
    SportCategoriesModel(
        imageUrl: AppAssets().football1,
        title: 'Football',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().basketball2,
        title: 'Basketball',
        backgroundColor: secondryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().tennis3,
        title: 'Tennis',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().volleyBall4,
        title: 'Volleyball',
        backgroundColor: secondryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().squash5,
        title: 'Squash',
        backgroundColor: primaryColor),
    SportCategoriesModel(
        imageUrl: AppAssets().golf6,
        title: 'Golf',
        backgroundColor: secondryColor),
  ];
  List<LinearGradient> sliderGradients = [
    LinearGradient(
      colors: [Color(0xff81F78E), primaryColor],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
    LinearGradient(
      colors: [
        Color(0xffFF876E),
        Color(0xffFF3660),
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
    LinearGradient(
      colors: [
        Color(0xff35E0FC),
        Color(0xff34A8FF),
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ];
}
