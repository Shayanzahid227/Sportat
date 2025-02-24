// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/sportat/home_sport_categories.dart';
import 'package:code_structure/custom_widgets/sportat/home_store_categories.dart';
import 'package:code_structure/custom_widgets/sportat/home_top_10_fields.dart';
import 'package:code_structure/custom_widgets/sportat/home_top_subscriptions.dart';
import 'package:code_structure/custom_widgets/sportat/text_field.dart';
import 'package:code_structure/ui/home/home_Screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    _header(),
                    SizedBox(height: 20.h),
                    _searchField(),
                    SizedBox(height: 20.h),
                    _sliderSection(),
                    20.h.verticalSpace,
                    _sportCategories(model),
                    20.h.verticalSpace,
                    _TopSubScriptions(model, context),
                    20.h.verticalSpace,
                    _Top10Fields(model, context),
                    20.h.verticalSpace,
                    _storeCategories(model),
                    100.h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// header
  _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xfff000000 % 40),
          radius: 30,
          backgroundImage: AssetImage(AppAssets().profileImage),
        ),
        10.horizontalSpace,
        Row(
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
        Container(
          height: 50,
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
                  color: secondryColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(2, 5),
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      AppAssets().pointsEarnIcon,
                    ),
                    fit: BoxFit.cover,
                    height: 34.h,
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
    );
  }

//  search field
  _searchField() {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            decoration: authSignUpFieldDecoration.copyWith(
              hintText: 'Search for sports or fields',
              prefixIcon: Image.asset(
                AppAssets().searchicon2,
                scale: 4,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  AppAssets()
                      .searchfieldIcon, // Assuming this is the slider/filter icon
                  scale: 5,
                ),
              ),
            ),
          )),
          10.horizontalSpace,
          // Notification Icon
          Container(
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
        ],
      ),
    );
  }

  // Slider Section
  Widget _sliderSection() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 220.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background stacked cards
              ...List.generate(
                2,
                (index) => Positioned(
                  bottom: (10.0 * index),
                  child: Container(
                    height: 180.h - (10.0 * index),
                    width: MediaQuery.of(context).size.width -
                        32.w -
                        (20.0 * index),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7 - (0.2 * index)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ).reversed,

              // Main card with content
              Container(
                height: 160.h,
                width: MediaQuery.of(context).size.width - 32.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: PageView.builder(
                  onPageChanged: (index) {
                    viewModel.setCurrentIndex(index);
                  },
                  itemCount: viewModel.sliders.length,
                  itemBuilder: (context, index) {
                    final slider = viewModel.sliders[index];
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 30.h,
                                    left: 10,
                                  ),
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontFamily:
                                            'Antonio', // Replace with your font
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'The ',
                                          style: style20N.copyWith(
                                            fontFamily: 'Antonio',
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'first',
                                          style: style20N.copyWith(
                                              fontFamily: 'Antonio',
                                              color: secondryColor
                                              // Make "first" blue
                                              ),
                                        ),
                                        TextSpan(
                                          text: ' healthy sports\ncommunity\n',
                                          style: style20N.copyWith(
                                            fontFamily: 'Antonio',
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'in the ',
                                          style: style20N.copyWith(
                                            fontFamily: 'Antonio',
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'world',
                                          style: style20N.copyWith(
                                            fontFamily: 'Antonio',

                                            color:
                                                secondryColor, // Make "world" blue
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Stack(
                              children: [
                                Image.asset(
                                  AppAssets().ellipse,
                                  fit: BoxFit.contain,
                                  height: 140.h,
                                  width: 140.w,
                                ),
                                Positioned(
                                    top: 10.h,
                                    right: 60.w,
                                    child: Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            slider.imageUrl!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Page indicators
              Positioned(
                bottom: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    viewModel.sliders.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: viewModel.currentIndex == index ? 34.w : 24.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: viewModel.currentIndex == index
                            ? secondryColor
                            : Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//
  _sportCategories(HomeViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppAssets().spotsCategoriesIcon,
              fit: BoxFit.cover,
              height: 25.h,
              width: 25.w,
            ),
            10.verticalSpace,
            Text(
              'Sport Categories',
              style: style20N.copyWith(color: blackColor),
            ),
            100.w.horizontalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "See All",
                  style: style16.copyWith(color: primaryColor),
                ),
              ),
            )
          ],
        ),
        20.verticalSpace,
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.sportCategoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomHomeSportCategoryCard(
                  Object_homeSportcategories: model.sportCategoriesList[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///
  /// top subscriptions
  ///
  Widget _TopSubScriptions(HomeViewModel model, BuildContext context) {
    PageController _pageController =
        PageController(viewportFraction: 0.8); // Adjusted viewport

    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppAssets().topSubscriptionIcon,
              fit: BoxFit.cover,
              height: 23.h,
              width: 23.w,
            ),
            SizedBox(
                width: 10
                    .w), // Use SizedBox with width in percentages for responsiveness
            Text(
              'Top Subscriptions',
              style: style20N.copyWith(color: blackColor),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: style16.copyWith(color: primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 130.h, // Match CustomTop10Fields height
          child: PageView.builder(
            controller: _pageController,
            itemCount: model.topSubscriptionsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomTopSubscriptions(
                  Object_topSubscriptions: model.topSubscriptionsList[index],
                  context: context,
                ),
              );
            },
            onPageChanged: (selectedSubscriptionIndex) {
              model.setselectedsubscriptionindex(
                  selectedSubscriptionIndex); // Update currentIndex in ViewModel
            },
          ),
        ),
        SizedBox(height: 10.h),
        // Page Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            model.topSubscriptionsList.length,
            (selectedSubscribtionFieldsIndex) => buildIndicator(
                model.selectedsubscriptionindex ==
                    selectedSubscribtionFieldsIndex,
                context),
          ),
        ),
      ],
    );
  }

  ///
  /// Top 10  Fields
  ///
  Widget _Top10Fields(HomeViewModel model, BuildContext context) {
    PageController _pageController =
        PageController(viewportFraction: 0.8); // Adjusted viewport

    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppAssets().top10FieldsIcon,
              fit: BoxFit.cover,
              height: 23.h,
              width: 23.w,
            ),
            SizedBox(
                width: 10
                    .w), // Use SizedBox with width in percentages for responsiveness
            Text(
              'Top 10  Fields',
              style: style20N.copyWith(color: blackColor),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: style16.copyWith(color: primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 130.h, // Match CustomTop10Fields height
          child: PageView.builder(
            controller: _pageController,
            itemCount: model.top10FieldsList.length,
            itemBuilder: (context, selectedFieldIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomTop10Fields(
                  Object_top10Field: model.top10FieldsList[selectedFieldIndex],
                  context: context,
                ),
              );
            },
            onPageChanged: (selectedFieldINdex) {
              model.setCurrentIndexx(
                  selectedFieldINdex); // Update currentIndex in ViewModel
            },
          ),
        ),

        // Page Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            model.top10FieldsList.length,
            (selectedFieldIndex) => buildIndicator(
                model.selectedFieldCurrentIndex == selectedFieldIndex, context),
          ),
        ),
      ],
    );
  }

  ///
  ///  store categories
  ///
  _storeCategories(HomeViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppAssets().storeCategoriesIcon,
              fit: BoxFit.cover,
              height: 23.h,
              width: 23.w,
            ),
            SizedBox(
                width: 10
                    .w), // Use SizedBox with width in percentages for responsiveness
            Text(
              'Store Categories',
              style: style20N.copyWith(
                  color: blackColor, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: style16.copyWith(color: primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        10.h.verticalSpace,
        SizedBox(
          height: 130.h,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: model.storeCategoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomStoreCategoriesCard(
                  Object_HomeStoreCategoriesModel:
                      model.storeCategoriesList[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///
  ///
  ///  this is for top 10  fields (indicator)
  ///
  Widget buildIndicator(bool isActive, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 5.h,
      width: 26.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(72),
        color: isActive ? secondryColor : Colors.grey,
      ),
    );
  }
}
