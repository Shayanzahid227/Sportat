// ignore_for_file: deprecated_member_use, unused_local_variable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:code_structure/custom_widgets/bottom_sheet/search_filter_bottom_sheet.dart';
import 'package:code_structure/ui/notification/notification_screen.dart';
import 'package:code_structure/ui/search/search_screen.dart';
import 'package:code_structure/ui/timeline/video_play.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'timeline_view_model.dart';
import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimelineViewModel(),
      child: Consumer<TimelineViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,

          ///
          /// App Bar
          ///
          appBar: _appBar(context, model),

          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: authFieldDecoration.copyWith(
                      hintText: "What's on your mind?",
                      suffixIcon: Image.asset(AppAssets().videoPlay, scale: 4),
                    ),
                  ),
                ),
                _iconAndText(
                  img: AppAssets().videoPlay,
                  title: "Timeline",
                  ontap: () {},
                ),
                20.verticalSpace,
                SizedBox(
                  height: 182.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.videoUrls.length,
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
                          width: 127.w,
                          decoration: BoxDecoration(
                            image: model.videoThumbnails
                                    .containsKey(model.videoUrls[index])
                                ? DecorationImage(
                                    image: NetworkImage(model.videoThumbnails[
                                        model.videoUrls[index]]!),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: AssetImage(AppAssets()
                                        .profileImage), // Default Image
                                    fit: BoxFit.cover,
                                  ),
                            border: Border.all(width: 1, color: secondaryColor),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Center(
                            child:
                                Image.asset(AppAssets().playCircle, scale: 3),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListView.builder(
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
                                  image: AssetImage(AppAssets().vedioImage),
                                  fit: BoxFit.cover)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: style14.copyWith(color: pinkColor),
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
                                    style: style14.copyWith(color: bordrColor),
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
                                    style: style14.copyWith(color: bordrColor),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
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
}

Widget _iconAndText(
    {required String img, required String title, required VoidCallback ontap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(img, scale: 3, color: bordrColor),
            SizedBox(width: 10.w),
            Text(title, style: style20N.copyWith(color: blackColor)),
          ],
        ),
        TextButton(
          onPressed: ontap,
          child: Text("See All", style: style16B.copyWith(color: primaryColor)),
        ),
      ],
    ),
  );
}

AppBar _appBar(BuildContext context, TimelineViewModel model) {
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

_searchField(BuildContext context, TimelineViewModel model) {
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
              Get.to(SearchScreen());
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
