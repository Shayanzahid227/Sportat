// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, deprecated_member_use
import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/top_subscriptions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTopSubscriptions extends StatelessWidget {
  final TopSubscriptions topSubscriptions;
  VoidCallback? ClubOnTap;
  CustomTopSubscriptions(
      {required this.topSubscriptions, required this.ClubOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        border: Border(
          bottom: BorderSide(
            color: primaryColor, // Border color
            width: 0.5, // Border width
          ),
          left: BorderSide(
            color: primaryColor, // Border color
            width: 0.5, // Border width
          ),
          right: BorderSide(
            color: primaryColor, // Border color
            width: 0.5, // Border width
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            height: 170.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              image: DecorationImage(
                image: AssetImage('${topSubscriptions.imageUrl}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              // Move padding to the container's child
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: ClubOnTap,
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        '${topSubscriptions.profileLogo}',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${topSubscriptions.title}",
                    style: style16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          20.verticalSpace,
          //  _textBelowImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets().pointsEarnedIcon,
                      color: secondaryColor,
                      scale: 4,
                    ),
                    5.horizontalSpace,
                    Text(
                      '${topSubscriptions.energyPoints}',
                      style: style14.copyWith(
                          fontWeight: FontWeight.w500, color: secondaryColor),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets().locationIcon,
                      scale: 3.5,
                    ),
                    5.horizontalSpace,
                    Text(
                      '${topSubscriptions.location}',
                      style: style14.copyWith(
                          fontWeight: FontWeight.w400, color: blackColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          10.h.verticalSpace,
        ],
      ),
    );
  }
}
