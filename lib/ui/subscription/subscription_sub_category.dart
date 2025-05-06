// ignore_for_file: deprecated_member_use

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/club_model.dart';
import 'package:code_structure/custom_widgets/bottom_sheet/search_filter_bottom_sheet.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:code_structure/custom_widgets/sportat/top_subscription_screen.dart';
import 'package:code_structure/ui/notification/notification_screen.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:code_structure/ui/search/search_screen.dart';
import 'package:code_structure/ui/subscription/subscription_field_detail.dart';
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class SubscriptionSubCategoryScreen extends StatefulWidget {
  final ClubModel? clubObject;
  final LinearGradient? gradient;
  const SubscriptionSubCategoryScreen(
      {super.key, required this.clubObject, required this.gradient});

  @override
  State<SubscriptionSubCategoryScreen> createState() =>
      _SubscriptionSubCategoryScreenState();
}

class _SubscriptionSubCategoryScreenState
    extends State<SubscriptionSubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(0),
      child: Consumer2<RootViewModel, SubscriptionViewModel>(
        builder: (context, rootModel, model, child) => Scaffold(
          appBar: _appBar(context, rootModel),
          body: Column(
            children: [
              30.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 66.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage("${widget.clubObject!.imgUrl}"),
                    //     fit: BoxFit.cover),
                    gradient: widget.gradient,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Row(
                    children: [
                      CustomBackButton(),
                      10.horizontalSpace,
                      Text(
                        // '${clubObject!.title}' ?? '',
                        '${widget.clubObject!.name}' ?? '',
                        style: style20B.copyWith(
                          color: whiteColor,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model.bookingFieldList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(SubscriptionFieldDetail());
                      },
                      child: CustomTopSubscriptions(
                        topSubscriptions: model.bookingFieldList[index],
                        ClubOnTap: () {},
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

AppBar _appBar(BuildContext context, RootViewModel model) {
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
        child: _searchField(context, model),
      ));
}

_searchField(BuildContext context, RootViewModel model) {
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
                search: model.selectedScreen,
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
