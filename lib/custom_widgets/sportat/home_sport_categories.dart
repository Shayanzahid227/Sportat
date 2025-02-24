// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:code_structure/core/model/home_sport_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeSportCategoryCard extends StatelessWidget {
  final SportCategoriesModel sportCategories;
  LinearGradient? gradient;

  CustomHomeSportCategoryCard({
    required this.gradient,
    required this.sportCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        gradient: gradient,
        color: sportCategories.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${sportCategories.title}' ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                '${sportCategories.imageUrl}' ?? '',
                height: 142.h,
                width: 90.w,
                fit: BoxFit.contain,
              ),
              Image.asset(
                "assets/icons_assets/ellipse.png",
                scale: 4,
              )
            ],
          )
        ],
      ),
    );
  }
}
