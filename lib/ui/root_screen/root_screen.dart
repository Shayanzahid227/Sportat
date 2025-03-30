import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/bottom_sheet/search_filter_bottom_sheet.dart';
import 'package:code_structure/ui/notification/notification_screen.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:code_structure/ui/search/search_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  final int? selectedScreen;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RootScreen({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(selectedScreen),
      child: Consumer<RootViewModel>(
        builder: (context, model, child) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,

          ///
          /// App Bar
          ///
          appBar: _appBar(context, model),

          ///
          /// Start Body
          ///
          body: model.allScreen[model.selectedScreen],

          ///
          /// BottomBar
          ///
          bottomNavigationBar: ConvexAppBar(
            height: 100,
            backgroundColor: whitecolor,
            activeColor: primaryColor,
            color: lightGreyColor,

            style:
                TabStyle.custom, // Change this to fixed so text always appears
            initialActiveIndex: model.selectedScreen,
            // disableDefaultTabController: true,
            onTap: (index) {
              model.updatedScreen(index);
            },
            items: [
              TabItem(
                  icon: Image.asset(
                    AppAssets().booking,
                    color:
                        model.selectedScreen == 0 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Booking'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().subscribe,
                    color:
                        model.selectedScreen == 1 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Subscribe'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().home,
                    color:
                        model.selectedScreen == 2 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Home'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().store,
                    color:
                        model.selectedScreen == 3 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Store'),
              TabItem(
                  icon: Image.asset(
                    AppAssets().timeline,
                    color:
                        model.selectedScreen == 4 ? whitecolor : lightGreyColor,
                    scale: 3,
                  ),
                  title: 'Timeline'),
            ],
          ),

          ///
          /// Right Drawer
          ///
          // endDrawer: buildDrawer(context),
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
          backgroundColor: Color(0xfff000000 % 40),
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
            color: whitecolor,
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
                    color: whitecolor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "1K",
                  style: style25B.copyWith(
                    color: secondryColor,
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
                color: whitecolor,
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
