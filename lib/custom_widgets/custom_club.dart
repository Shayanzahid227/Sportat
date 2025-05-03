// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/club_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomClub extends StatelessWidget {
  ClubModel clubModel;
  void Function()? onTap; // <-- added optional onTap
  CustomClub({required this.clubModel, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            image: DecorationImage(
                image: AssetImage(
                  "${clubModel.imgUrl}",
                ),
                fit: BoxFit.cover)),
        child: Text(
          "${clubModel.name}",
          style: style16B.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
