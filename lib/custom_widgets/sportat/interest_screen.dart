import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/Interest_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInterestScreen extends StatelessWidget {
  InterestScreenModel ObjectInterestScreenModel;
  int isColorChange;
  int index;
  CustomInterestScreen(
      {super.key,
      required this.ObjectInterestScreenModel,
      required this.index,
      required this.isColorChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 35.h,

      decoration: BoxDecoration(
        color: isColorChange == index ? SecondryColor : backGroundCOlor,
        // color: model.isColorChange ? SecondryColor : backGroundCOlor,
        borderRadius: BorderRadius.circular(82),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          5.horizontalSpace,
          Image.asset(
            height: 20.h,
            width: 20.w,
            '${ObjectInterestScreenModel.icon}',
            fit: BoxFit.cover,
          ),
          5.horizontalSpace,
          Text(
            "${ObjectInterestScreenModel.title}",
            style: style14.copyWith(
                color: isColorChange == index ? whitecolor : blackColor,
                // color: model.isColorChange ? whitecolor : blackColor,
                fontWeight: FontWeight.w400),
          ),
          2.horizontalSpace,
          isColorChange == index
              ? Container(
                  height: 20,
                  width: 12,
                  decoration: BoxDecoration(),
                  child: Icon(
                    Icons.check,
                    color: isColorChange == index ? whitecolor : null,
                  ),
                )
              : Container(),
          2.horizontalSpace,
        ],
      ),
    );
  }
}
