// ignore_for_file: unused_element, use_key_in_widget_constructors, deprecated_member_use

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/sportat/top_subscription_screen.dart';
import 'package:code_structure/ui/top_subscription_screen/top_subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';

class TopSubScriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopSubscriptionViewModel(),
      child: Consumer<TopSubscriptionViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            children: [
              60.verticalSpace,
              _header(context),
              20.h.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: model.topSubscriptionsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomTopSubscriptions(
                        topSubscriptions: model.topSubscriptionsList[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(6),
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GestureDetector(
                  onTap: () {
                    navigator?.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 25,
                    color: borderColor,
                  ),
                )),
          ),
          40.horizontalSpace,
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Top Subscriptions",
              style: style25B.copyWith(
                fontWeight: FontWeight.w500,
                color: lightGreyColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 170.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        image: DecorationImage(
          image: AssetImage(AppAssets().topSubscriptionStadiumImage),
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
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.white,
              child: Image.asset(
                AppAssets().topSubscriptionStadiumLogo,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Sporting Club",
              style: style16.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
    //
    // text below main image
  }

  Widget _textBelowImage() {
    return Padding(
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
                    AppAssets().pointsEarnIcon,
                    color: secondryColor,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              5.w.horizontalSpace,
              Text(
                '100 energy points',
                style: style14.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: secondryColor),
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
                    AppAssets().locationIcon,
                    color: borderColor,
                    fit: BoxFit.cover,
                  ),
                ),
                5.horizontalSpace,
                Text(
                  'Riyadh Area',
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
    );
  }
}
