// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/custom_widgets/custom_club.dart';
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscribtionScreen extends StatelessWidget {
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
                  return CustomClub(clubModel: model.clubList[index]);
                })),
      ),
    );
  }
}
