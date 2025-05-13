import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/strings.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/sportat/interest_screen.dart';
import 'package:code_structure/ui/auth/Interest/interest_screen_view_model.dart';
import 'package:code_structure/ui/notification/notification_screen.dart';
import 'package:code_structure/ui/setting/setting_screen.dart';
import 'package:code_structure/ui/timeline/video_play.dart';
import 'package:code_structure/ui/user_profile/edit_profile/edit_profile_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/menu_and_settings.dart';
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

                    ///
                    ///      if want to separate each section (reels , post and reposts then uncomment below line )
                    ///

                    // _buildTabContent(model.selectedTabIndex),
                  ],
                ),
                model.selectedTabIndex == 0

                    ///
                    ///      posts
                    ///
                    ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.videoUrls.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                    videoUrls: model.videoUrls,
                                    startIndex: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 16.w),
                              width: 108.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                image: model.videoThumbnails
                                        .containsKey(model.videoUrls[index])
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            model.videoThumbnails[
                                                model.videoUrls[index]]!),
                                        fit: BoxFit.cover,
                                      )
                                    : DecorationImage(
                                        image: AssetImage(AppAssets()
                                            .profileImage), // Default Image
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  8.verticalSpace,
                                  Image.asset(AppAssets().playCircle, scale: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppAssets().play,
                                            scale: 3,
                                          ),
                                          10.horizontalSpace,
                                          Text(
                                            "1.2M",
                                            style: style14B.copyWith(
                                                color: whiteColor),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })

                    ///
                    ///      reels
                    ///
                    : model.selectedTabIndex == 1
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage:
                                          AssetImage(AppAssets().profileImage),
                                    ),
                                    title: Text(
                                      "Muhammad Darwish",
                                      style: style14,
                                    ),
                                    subtitle: Text(
                                      '1 minute ago',
                                      style:
                                          style14.copyWith(color: borderColor),
                                    ),
                                    trailing: Icon(
                                      Icons.more_vert,
                                      color: blackColor,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 183.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppAssets().vedioImage),
                                            fit: BoxFit.cover)),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 16),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppAssets().likee,
                                              scale: 3,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "12.2k",
                                              style: style14.copyWith(
                                                  color: pinkColor),
                                            ),
                                            20.horizontalSpace,
                                            Image.asset(
                                              AppAssets().repost,
                                              scale: 3,
                                              color: bordrColor,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "120",
                                              style: style14.copyWith(
                                                  color: bordrColor),
                                            ),
                                            20.horizontalSpace,
                                            Image.asset(
                                              AppAssets().share,
                                              scale: 3,
                                              color: bordrColor,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "12",
                                              style: style14.copyWith(
                                                  color: bordrColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: Image.asset(
                                          AppAssets().addFav,
                                          scale: 3,
                                          color: bordrColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage:
                                          AssetImage(AppAssets().profileImage),
                                    ),
                                    title: Text(
                                      "Muhammad Darwish",
                                      style: style14,
                                    ),
                                    subtitle: Text(
                                      '1 minute ago',
                                      style:
                                          style14.copyWith(color: borderColor),
                                    ),
                                    trailing: Icon(
                                      Icons.more_vert,
                                      color: blackColor,
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        height: 183.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            AppAssets().vedioImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 16,
                                        right: 16,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundImage: AssetImage(
                                                        AppAssets()
                                                            .profileImage),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    'shayan zahid',
                                                    style: style12.copyWith(
                                                        color: whiteColor),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    AppAssets().repost,
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  SizedBox(width: 6),
                                                  Text(
                                                    "Repost",
                                                    style: style12.copyWith(
                                                        color: whiteColor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 16),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppAssets().likee,
                                              scale: 3,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "12.2k",
                                              style: style14.copyWith(
                                                  color: pinkColor),
                                            ),
                                            20.horizontalSpace,
                                            Image.asset(
                                              AppAssets().repost,
                                              scale: 3,
                                              color: bordrColor,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "120",
                                              style: style14.copyWith(
                                                  color: bordrColor),
                                            ),
                                            20.horizontalSpace,
                                            Image.asset(
                                              AppAssets().share,
                                              scale: 3,
                                              color: bordrColor,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "12",
                                              style: style14.copyWith(
                                                  color: bordrColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: Image.asset(
                                          AppAssets().addFav,
                                          scale: 3,
                                          color: bordrColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///     top header section have back and notification button
  ///
  _topHeaderSection() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Spacer(),
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

        ///
        ///     menu and  setting
        ///
        GestureDetector(
          onTap: () {
            Get.to(MenuAndSettingsScreen());
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
                AppAssets().settingIcon,
                scale: 3,
              ),
            ),
          ),
        ),
      ],
    );
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
                  child: GestureDetector(
                    onTap: () {
                      Get.to(EditProfileScreen());
                    },
                    child: Container(
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
}
