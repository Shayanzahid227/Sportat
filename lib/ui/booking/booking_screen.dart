// ignore_for_file: use_key_in_widget_constructors

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/sportat/home_sport_categories.dart';
import 'package:code_structure/ui/booking/booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BookingViewModel(),
        child: Consumer<BookingViewModel>(
          builder: (context, model, child) => Scaffold(
            backgroundColor: backGroundColor,

            ///
            /// Start Body
            ///
            body: GridView.builder(
                padding: EdgeInsets.only(top: 16),
                itemCount: model.sportCategoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  List<LinearGradient> shuffledGradients =
                      List.from(model.sliderGradients);
                  shuffledGradients.shuffle(); // Gradients ko shuffle kar diya
                  return CustomSportCategory(
                    sportCategories: model.sportCategoriesList[index],
                    gradient: shuffledGradients[index %
                        shuffledGradients.length], // Ensuring uniqueness
                  );
                }),
          ),
        ));
  }
}
