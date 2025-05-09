// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/strings.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:code_structure/ui/club_profile/club_profile_view_model.dart';
import 'package:code_structure/ui/timeline/video_play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ClubProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClubProfileViewModel(),
      child: Consumer<ClubProfileViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            ///
            /// Start Body
            ///
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
                  /// Top Header
                  ///
                  Stack(
                    children: [
                      _borderCircle(model),

                      ///
                      /// Details Follow, reels and posts
                      ///
                      _clubInfo(model),
                    ],
                  ),
                  model.selectedTabIndex == 0
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
                                    style: style14.copyWith(color: borderColor),
                                  ),
                                  trailing: Icon(
                                    Icons.more_vert,
                                    color: blackColor,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 183.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
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
                      : model.selectedTabIndex == 1
                          ? GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: model.videoUrls.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                                      image: model.videoThumbnails.containsKey(
                                              model.videoUrls[index])
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
                                        Image.asset(AppAssets().playCircle,
                                            scale: 3),
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
                          : Center(
                              child: Text(
                                "Empty Repost",
                                style: style25B,
                              ),
                            ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

_topHeader(ClubProfileViewModel model) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.bottomCenter,
    children: [
      Stack(
        children: [
          ///
          /// Slider Images
          ///
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("$dynamicAssets/searchResult1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          ///
          /// Back Button
          ///
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: CustomBackButton(),
          ),
        ],
      ),
    ],
  );
}

_social({required String number, required String text}) {
  return Container(
    width: 95.w,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          style: style16,
          maxLines: 1,
        )
      ],
    ),
  );
}

_tabs(
    {required String text,
    required bool isSelected,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: 77.w,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color:
            isSelected ? secondaryColor.withOpacity(0.20) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: isSelected ? secondaryColor.withOpacity(0.20) : blackColor,
        ),
      ),
      child: Text(
        text,
        style:
            style14.copyWith(color: isSelected ? secondaryColor : blackColor),
      ),
    ),
  );
}

_borderCircle(ClubProfileViewModel model) {
  return Stack(
    alignment: Alignment.bottomCenter,
    clipBehavior: Clip.none,
    children: [
      _topHeader(model),
      Positioned(
        bottom: -60,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            height: 170,
            width: 170,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: transparentColor,
                border: Border.all(width: 1, color: primaryColor)),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: transparentColor,
                  border: Border.all(width: 3, color: primaryColor)),
            ),
          ),
        ),
      ),
    ],
  );
}

_clubInfo(ClubProfileViewModel model) {
  return Padding(
    padding: const EdgeInsets.only(top: 160.0),
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
                            "Zen Club",
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
                    Text(
                      "Joined Since Feb. 2022",
                      style: style14,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ",
                  style: style12,
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Follow",
                        style: style16B.copyWith(color: whiteColor),
                      ),
                      10.horizontalSpace,
                      Image.asset(
                        AppAssets().followIcon,
                        scale: 4,
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  _social(number: '10k', text: 'Reels'),
                  _social(number: '10k', text: 'Posts'),
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
                    image: AssetImage("$staticAssets/logo.png"),
                    fit: BoxFit.cover)),
          ),
        ),
      ],
    ),
  );
}
