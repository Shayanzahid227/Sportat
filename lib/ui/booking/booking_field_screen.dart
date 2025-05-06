// ignore_for_file: use_key_in_widget_constructors

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_sport_categories_model.dart';
import 'package:code_structure/custom_widgets/bottom_sheet/search_filter_bottom_sheet.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:code_structure/custom_widgets/sportat/top_subscription_screen.dart';
import 'package:code_structure/ui/booking/booking_view_model.dart';
import 'package:code_structure/ui/booking/field_details/field_details_screen.dart';
import 'package:code_structure/ui/club_profile/club_profile_screen.dart';
import 'package:code_structure/ui/notification/notification_screen.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:code_structure/ui/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class BookingFieldScreen extends StatelessWidget {
  final SportCategoriesModel? sportsCategory;
  final LinearGradient? gradient;
  const BookingFieldScreen(
      {required this.sportsCategory, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Consumer2<BookingViewModel, RootViewModel>(
      builder: (context, bookingmodel, rootmodel, child) => Scaffold(
        appBar: _appBar(context, rootmodel),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              30.verticalSpace,
              Container(
                height: 66.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Row(
                    children: [
                      CustomBackButton(),
                      10.horizontalSpace,
                      Text(
                        '${sportsCategory!.title}' ?? '',
                        style: style20B.copyWith(
                          color: whiteColor,
                          fontSize: 20.sp,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        "${sportsCategory!.imageUrl}",
                        scale: 2,
                      ),
                    ],
                  ),
                ),
              ),
              30.verticalSpace,
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: bookingmodel.bookingFieldList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(BookingFieldDetailsScreen());
                      },
                      child: CustomTopSubscriptions(
                        topSubscriptions: bookingmodel.bookingFieldList[index],
                        ClubOnTap: () {
                          Get.to(ClubProfileScreen());
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context, RootViewModel rootmodel) {
  return AppBar(
      elevation: 0.0,
      backgroundColor: backGroundColor,
      surfaceTintColor: backGroundColor,
      shadowColor: backGroundColor,
      foregroundColor: backGroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: CircleAvatar(
          backgroundColor: redColor,
          radius: 30,
          backgroundImage: AssetImage(AppAssets().profileImage),
        ),
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets().locationIcon,
            fit: BoxFit.cover,
            color: borderColor,
            scale: 3.5,
          ),
          5.horizontalSpace,
          Text(
            'Riyadh Area',
            style: style16B.copyWith(
                fontWeight: FontWeight.w400, color: blackColor),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: blackColor,
            size: 30.sp,
          ),
        ],
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 51,
                height: 51,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.20),
                      blurRadius: 30,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      AppAssets().pointsEarnIcon,
                    ),
                    height: 30.h,
                    color: whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "1K",
                  style: style25B.copyWith(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: _searchField(context, rootmodel),
      ));
}

_searchField(BuildContext context, RootViewModel rootmodel) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            readOnly: true,
            onTap: () {
              Get.to(SearchScreen(
                search: rootmodel.selectedScreen,
              ));
            },
            decoration: authSignUpFieldDecoration.copyWith(
              contentPadding: EdgeInsets.all(5),
              hintText: 'Search for sports or fields',
              hintStyle: style16.copyWith(color: lightGreyColor),
              prefixIcon: Image.asset(
                AppAssets().searchicon2,
                scale: 4,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  SearchFilterBottomSheet.show(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    AppAssets()
                        .searchfieldIcon, // Assuming this is the slider/filter icon
                    scale: 5,
                  ),
                ),
              ),
            ),
          )),
          10.horizontalSpace,
          // Notification Icon
          GestureDetector(
            onTap: () {
              Get.to(NotificationScreen());
            },
            child: Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: transparentColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset(
                AppAssets().notificationIcon,
                scale: 3,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
