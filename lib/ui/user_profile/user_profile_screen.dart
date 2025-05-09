import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/strings.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/sportat/interest_screen.dart';
import 'package:code_structure/ui/auth/Interest/interest_screen_view_model.dart';
import 'package:code_structure/ui/notification/notification_screen.dart';
import 'package:code_structure/ui/user_profile/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProfileViewModel(),
      child: Consumer2<UserProfileViewModel, InterestScreenViewModel>(
        builder: (context, model, interestModel, child) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    _topHeaderSection(),

                    ///
                    /// Details Follow, reels and posts
                    ///
                    _clubInfo(model, interestModel),
                    _buildTabContent(model.selectedTabIndex),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///     top header section have back and notification button
  ///
  _topHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop!(context);
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  border: Border.all(color: lightGreyColor),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: lightGreyColor,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(NotificationScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 15),
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
        ),
      ],
    );
  }

  ///
  ///    follower    reels   and     posts    amount   container
  ///
  _social({required String number, required String text}) {
    return Container(
      // width: 95.w,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
      decoration: BoxDecoration(
          color: transparentColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: borderColor)),
      child: Column(
        children: [
          Text(
            number,
            style: style16B,
          ),
          Text(
            text,
            style: style14,
            maxLines: 1,
          )
        ],
      ),
    );
  }

  ///
  ///      reels     posts   and    reposts    amount   container
  ///
  _tabs(
      {required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 90.w,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: isSelected ? secondaryColor : blackColor,
          ),
        ),
        child: Text(
          text,
          style: style14.copyWith(color: isSelected ? whiteColor : blackColor),
        ),
      ),
    );
  }

  ///
  ///     user interest
  ///
  _userInterestSection(InterestScreenViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(),
      child: Row(
        children: [
          CustomInterestWidget(
              interestModel: model.interestList[0],
              index: 0,
              isSelected: false),
          5.horizontalSpace,
          CustomInterestWidget(
              interestModel: model.interestList[2],
              index: 1,
              isSelected: false),
          5.horizontalSpace,
          CustomInterestWidget(
              interestModel: model.interestList[3], index: 3, isSelected: false)
        ],
      ),
    );
  }

  ///
  /// Content widgets for each tab
  ///
  Widget _buildReelsContent({Key? key}) {
    return Container(
      key: key,
      height: 200, // Adjust height as needed
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          "Reels Content Will Appear Here",
          style: style16B,
        ),
      ),
    );
  }

  Widget _buildPostsContent({Key? key}) {
    return Container(
      key: key,
      height: 200, // Adjust height as needed
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          "Posts Content Will Appear Here",
          style: style16B,
        ),
      ),
    );
  }

  Widget _buildRepostsContent({Key? key}) {
    return Container(
      key: key,
      height: 200, // Adjust height as needed
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          "Reposts Content Will Appear Here",
          style: style16B,
        ),
      ),
    );
  }

  ///
  /// Method to switch between content based on selected tab
  ///
  Widget _buildTabContent(int selectedIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 630.0),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _getContentWidget(selectedIndex),
      ),
    );
  }

  Widget _getContentWidget(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return _buildReelsContent(key: ValueKey('reels'));
      case 1:
        return _buildPostsContent(key: ValueKey('posts'));
      case 2:
        return _buildRepostsContent(key: ValueKey('reposts'));
      default:
        return _buildReelsContent(key: ValueKey('reels_default'));
    }
  }

  ///
  /// Club Info Widget with updated tab content section
  ///
  _clubInfo(UserProfileViewModel model, InterestScreenViewModel interestModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 110.0),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          ///
          /// Follow, reels and posts
          ///
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ///
                /// Club Name
                ///

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Shayan Zahid",
                              style: style25B,
                            ),
                          ),
                          10.horizontalSpace,
                          Image.asset(
                            "$iconsAssets/offical_batch.png",
                            scale: 4,
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        "Loves Editing & Designing !! Loves Editing & Designing !!",
                        style: style14.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Center(
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: primaryColor, width: 0.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "edit Profile",
                          style: style14.copyWith(
                            color: titleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                _userInterestSection(interestModel),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets().locationIcon,
                      scale: 4,
                    ),
                    5.horizontalSpace,
                    Text(
                      "Saudi Arabia-Jadda",
                      style: style16,
                    )
                  ],
                ),
                5.verticalSpace,
                Divider(
                  thickness: 0.4,
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _social(number: '1k', text: 'Followers'),
                    _social(number: '10k', text: 'Following'),
                    _social(number: '10k', text: 'Energy Points'),
                  ],
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                    (index) {
                      final tabTitles = ['Reels', 'Posts', 'Reposts'];
                      return _tabs(
                        text: tabTitles[index],
                        isSelected: model.selectedTabIndex == index,
                        onTap: () => model.setSelectedTab(index),
                      );
                    },
                  ),
                ),

                // Add the tab content section here
                SizedBox(height: 20),
              ],
            ),
          ),

          ///
          /// Club Profile
          ///
          Positioned(
            top: -40,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: blackColor.withOpacity(0.16),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                        spreadRadius: 0)
                  ],
                  image: DecorationImage(
                      image: AssetImage(AppAssets().tennis3),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: -50,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: transparentColor,
                  border: Border.all(color: blackColor)),
            ),
          ),
        ],
      ),
    );
  }
}
