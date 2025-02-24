// ignore_for_file: use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_store_categories.dart';
import 'package:flutter/material.dart';

class CustomStoreCategoriesCard extends StatelessWidget {
  final StoreCategoriesModel storeCategoriesModel;

  const CustomStoreCategoriesCard({required this.storeCategoriesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 72,
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primaryColor, width: 0.4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: storeCategoriesModel.imageUrl != null
                    ? Image.asset(
                        storeCategoriesModel
                            .imageUrl!, // Use ! to assert not null
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/placeholder_image.png'), // Placeholder
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            storeCategoriesModel.title ??
                'No Title', // Use ?? for default title
            style: style14.copyWith(
                fontWeight: FontWeight.w500, color: blackColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
