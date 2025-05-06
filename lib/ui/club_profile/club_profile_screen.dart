// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/strings.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:code_structure/ui/club_profile/club_profile_view_model.dart';
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
            backgroundColor: whiteColor,

            ///
            /// Start Body
            ///
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    clipBehavior: Clip.none,
                    children: [
                      _topHeader(model),
                      Positioned(
                        bottom: -60,
                        left: 20,
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
                                  image: AssetImage(
                                      "$staticAssets/finalLogo2.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),

                  ///
                  /// Club Name
                  ///

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _container(number: '1k', text: 'Followers'),
                      _container(number: '10k', text: 'Reels'),
                      _container(number: '10k', text: 'Posts'),
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
                      : SizedBox()
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

_container({required String number, required String text}) {
  return Container(
    width: 95.w,
    padding: EdgeInsets.all(10),
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
        color: isSelected ? secondaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: isSelected ? secondaryColor : blackColor,
        ),
      ),
      child: Text(
        text,
        style: style16.copyWith(color: isSelected ? whiteColor : blackColor),
      ),
    ),
  );
}
