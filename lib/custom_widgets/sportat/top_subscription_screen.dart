import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/top_subscriptions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTopSubscriptionsScreenWidget extends StatelessWidget {
  final TopSubscriptionsScreenModel Object_topSubscriptionsScreenModel;
  CustomTopSubscriptionsScreenWidget(
      {required this.Object_topSubscriptionsScreenModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0), // Add some margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0), // Rounded corners
        border: Border.all(color: PrimaryColor, width: 0.3), // Purple border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  _buildImageSection(),
          //10.verticalSpace,
          // _textBelowImage()
          // 10.verticalspace,
          Container(
            alignment: Alignment.bottomLeft,
            height: 170.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              image: DecorationImage(
                image: AssetImage(
                    '${Object_topSubscriptionsScreenModel.imageUrl}'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.transparent,
                ],
                stops: [0.6, 1.0],
              ),
            ),
            child: Padding(
              // Move padding to the container's child
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      '${Object_topSubscriptionsScreenModel.profileLogo}',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${Object_topSubscriptionsScreenModel.title}",
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
              children: [
                Row(
                  children: [
                    Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Image.asset(
                          ' ${Object_topSubscriptionsScreenModel.title}',
                          color: SecondryColor,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    5.w.horizontalSpace,
                    Text(
                      '${Object_topSubscriptionsScreenModel.energyPoints}',
                      style: style14.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: SecondryColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 25.h,
                        width: 20.w,
                        decoration: BoxDecoration(),
                        padding: EdgeInsets.all(2),
                        child: Image.asset(
                          '${Object_topSubscriptionsScreenModel.locationIcon}',
                          color: borderColor,
                          fit: BoxFit.cover,
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        '${Object_topSubscriptionsScreenModel.location}',
                        style: style14.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                      ),
                    ],
                  ),
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
