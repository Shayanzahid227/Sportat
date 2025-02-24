// ignore_for_file: use_key_in_widget_constructors

import 'package:code_structure/core/model/home_sport_categories_model.dart';
import 'package:flutter/material.dart';

class CustomHomeSportCategoryCard extends StatelessWidget {
  final HomeSportCategoriesModel Object_homeSportcategories;

  const CustomHomeSportCategoryCard({
    required this.Object_homeSportcategories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        color: Object_homeSportcategories.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${Object_homeSportcategories.title}' ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                '${Object_homeSportcategories.imageUrl}' ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
