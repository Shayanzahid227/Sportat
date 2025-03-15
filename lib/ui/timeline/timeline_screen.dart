// ignore_for_file: deprecated_member_use, unused_local_variable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:code_structure/ui/timeline/video_play.dart';
import 'package:flutter/material.dart';
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
                            border: Border.all(width: 1, color: secondryColor),
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
