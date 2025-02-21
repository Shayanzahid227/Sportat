import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_store_categories.dart';
import 'package:flutter/material.dart';

class CustomStoreCategoriesCard extends StatelessWidget {
  final HomeStoreCategoriesModel Object_HomeStoreCategoriesModel;

  CustomStoreCategoriesCard({required this.Object_HomeStoreCategoriesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 72,
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: PrimaryColor, width: 0.4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Object_HomeStoreCategoriesModel.imageUrl != null
                    ? Image.asset(
                        Object_HomeStoreCategoriesModel
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
            Object_HomeStoreCategoriesModel.title ??
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
