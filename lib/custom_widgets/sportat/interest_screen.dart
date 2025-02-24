import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/Interest_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInterestScreen extends StatelessWidget {
  final InterestModel interestModel;
  final bool isSelected;
  final int index;

  const CustomInterestScreen({
    super.key,
    required this.interestModel,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? secondryColor : backGroundColor,
        borderRadius: BorderRadius.circular(82),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                height: 15.h,
                width: 15.w,
                "${interestModel.icon}",
                fit: BoxFit.cover,
              ),
              10.horizontalSpace,
              Text(
                "${interestModel.title}",
                style: style14.copyWith(
                  color: isSelected ? whitecolor : blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          if (isSelected)
            Expanded(
              child: Icon(
                Icons.check,
                color: whitecolor,
                size: 20.sp,
              ),
            ),
        ],
      ),
    );
  }
}
