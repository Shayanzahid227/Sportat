// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/custom_widgets/custom_club.dart';
import 'package:code_structure/ui/subscription/field_details/field_details_screen.dart';
import 'package:code_structure/ui/subscription/subscription_sub_category.dart';
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscribtionViewModel(),
      child: Consumer<SubscribtionViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: backGroundColor,
            body: GridView.builder(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                shrinkWrap: true,
                itemCount: model.clubList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.7,
                ),
                itemBuilder: (context, index) {
                  List<LinearGradient> shuffledGradients =
                      List.from(model.colorsList);
                  return GestureDetector(
                      onTap: () {
                        Get.to(
                          ///
                          ///     check this portion
                          ///
                          () => SubscriptionSubCategoryScreen(
                            clubObject: model.clubList[index],
                            gradient: shuffledGradients[index %
                                shuffledGradients
                                    .length], // Ensuring uniqueness
                          ),
                        );
                      },
                      child: CustomClub(clubModel: model.clubList[index]));
                })),
      ),
    );
  }
}
