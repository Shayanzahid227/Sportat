// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/new_arrivals_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNewArrivals extends StatelessWidget {
  NewArrivalsModel newArrivalsModel;
  VoidCallback? addCartOnTap;
  CustomNewArrivals(
      {required this.newArrivalsModel, required this.addCartOnTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: 160.w,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          ///
          /// Image
          ///
          Container(
            height: 135.h,
            width: 135.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                image: DecorationImage(
                    image: AssetImage("${newArrivalsModel.imageUrl}"),
                    fit: BoxFit.cover)),
          ),
          10.verticalSpace,

          ///
          /// Title
          ///
          Text(
            "${newArrivalsModel.title}",
            overflow: TextOverflow.ellipsis,
            style: style14.copyWith(
              color: blackColor,
            ),
          ),
          5.verticalSpace,

          ///
          /// Price
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${newArrivalsModel.price} SAR",
                overflow: TextOverflow.ellipsis,
                style: style14B.copyWith(
                  color: primaryColor,
                ),
              ),
              GestureDetector(
                onTap: addCartOnTap,
                child: Image.asset(
                  AppAssets().addToCartScreenIcon,
                  scale: 4,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
