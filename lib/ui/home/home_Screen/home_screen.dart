// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_slider_model.dart';
import 'package:code_structure/custom_widgets/sportat/home_sport_categories.dart';
import 'package:code_structure/custom_widgets/sportat/home_store_categories.dart';
import 'package:code_structure/custom_widgets/sportat/home_top_10_fields.dart';
import 'package:code_structure/custom_widgets/sportat/home_top_subscriptions.dart';
import 'package:code_structure/ui/home/home_Screen/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,

          ///
          /// App Bar
          ///
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: _appBar(),
          ),

          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Column(
              children: [
                _searchField(),
                _sliderSection(),
                _sportCategories(model),
                20.h.verticalSpace,
                _topSubScriptions(model, context),
                20.h.verticalSpace,
                _top10Fields(model, context),
                20.h.verticalSpace,
                _storeCategories(model),
                100.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

//  search field
  _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            decoration: authSignUpFieldDecoration.copyWith(
              contentPadding: EdgeInsets.all(5),
              hintText: 'Search for sports or fields',
              hintStyle: style16.copyWith(color: lightGreyColor),
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
    return Consumer<HomeViewModel>(builder: (context, viewModel, child) {
      return SizedBox(
        height: 220.h,
        child: Transform.flip(
          flipY: true,
          child: Swiper(
            loop: true,
            itemWidth: 500,
            itemHeight: 225,
            autoplay: true,
            duration: kDefaultAutoplayDelayMs,
            layout: SwiperLayout.STACK,
            scrollDirection: Axis.vertical,
            itemCount: viewModel.sliders.length,
            onIndexChanged: (index) {
              viewModel.setCurrentIndex(index);
            },
            itemBuilder: (context, index) {
              final slider = viewModel.sliders[index];
              return Transform.flip(
                flipY: true,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      width: MediaQuery.of(context).size.width - 32.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: _buildTextWithImage(slider, context),
                    ),

                    // Page indicators
                    Positioned(
                      bottom: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          viewModel.sliders.length,
                          (indicatorIndex) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            width: viewModel.currentIndex == indicatorIndex
                                ? 34.w
                                : 24.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: viewModel.currentIndex == indicatorIndex
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
          ),
        ),
      );
    });
  }

// Function for Text on Left & Image on Right
  Widget _buildTextWithImage(SliderModel slider, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 30),
            child: _buildRichText(),
          ),
        ),
        _buildImage(slider.imageUrl),
      ],
    );
  }

// Function for Text Content
  Widget _buildRichText() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: TextStyle(
          fontFamily: GoogleFonts.antonio().fontFamily,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'The ',
            style: style20N.copyWith(fontFamily: 'Antonio'),
          ),
          TextSpan(
            text: 'first',
            style:
                style20N.copyWith(fontFamily: 'Antonio', color: secondryColor),
          ),
          TextSpan(
            text: ' healthy sports community ',
            style: style20N.copyWith(fontFamily: 'Antonio'),
          ),
          TextSpan(
            text: 'in the ',
            style: style20N.copyWith(fontFamily: 'Antonio'),
          ),
          TextSpan(
            text: 'world',
            style:
                style20N.copyWith(fontFamily: 'Antonio', color: secondryColor),
          ),
        ],
      ),
    );
  }

// Function for Image Widget
  Widget _buildImage(String? imageUrl) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.r)),
          child: Image.asset(AppAssets().ellipse, height: 120),
        ),
        Image.asset(imageUrl!),
      ],
    );
  }

//

  _sportCategories(HomeViewModel model) {
    List<LinearGradient> shuffledGradients = List.from(model.sliderGradients);
    shuffledGradients.shuffle(); // Gradients ko shuffle kar diya

    return Column(
      children: [
        _iconAndText(
          img: AppAssets().spotsCategoriesIcon,
          title: "Sport Categories",
          ontap: () {},
        ),
        20.verticalSpace,
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: ListView.builder(
            controller: model.scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: model.sportCategoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              // int randomIndex = random.nextInt(model.sliderGradients.length);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomHomeSportCategoryCard(
                  sportCategories: model.sportCategoriesList[index],
                  gradient: shuffledGradients[
                      index % shuffledGradients.length], // Ensuring uniqueness
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
  Widget _topSubScriptions(HomeViewModel model, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _iconAndText(
            img: AppAssets().topSubscriptionIcon,
            title: "Top Subscriptions",
            ontap: () {}),
        SizedBox(height: 10.h),
        SizedBox(
          height: 130.h, // Match CustomTop10Fields height
          child: PageView.builder(
            controller: model.subscriptionPageController,
            itemCount: model.topSubscriptionsList.length,
            itemBuilder: (context, index) {
              return CustomTopSubscriptions(
                topSubscriptions: model.topSubscriptionsList[index],
              );
            },
            onPageChanged: (selectedSubscriptionIndex) {
              model.setselectedsubscriptionindex(
                  selectedSubscriptionIndex); // Update currentIndex in ViewModel
            },
          ),
        ),
        15.verticalSpace,
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
  Widget _top10Fields(HomeViewModel model, BuildContext context) {
    return Column(
      children: [
        _iconAndText(
          img: AppAssets().top10FieldsIcon,
          title: "Top 10 Categories",
          ontap: () {},
        ),

        SizedBox(height: 10.h),
        SizedBox(
          height: 130.h, // Match CustomTop10Fields height
          child: PageView.builder(
            controller: model.top10PageController,
            itemCount: model.top10FieldsList.length,
            itemBuilder: (context, selectedFieldIndex) {
              return CustomTop10Fields(
                top10Field: model.top10FieldsList[selectedFieldIndex],
              );
            },
            onPageChanged: (selectedFieldINdex) {
              model.setCurrentIndexx(
                  selectedFieldINdex); // Update currentIndex in ViewModel
            },
          ),
        ),
        15.verticalSpace,
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
        _iconAndText(
          img: AppAssets().storeCategoriesIcon,
          title: "Store Categories",
          ontap: () {},
        ),
        10.h.verticalSpace,
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            controller: model.storeScrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: model.storeCategoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomStoreCategoriesCard(
                storeCategoriesModel: model.storeCategoriesList[index],
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

AppBar _appBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: backGroundColor,
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
          style:
              style16B.copyWith(fontWeight: FontWeight.w400, color: blackColor),
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
  );
}

_iconAndText(
    {required String? img,
    required String? title,
    required VoidCallback? ontap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              img!,
              fit: BoxFit.cover,
              height: 25.h,
              width: 25.w,
            ),
            10.horizontalSpace,
            Text(
              '$title',
              style: style20N.copyWith(color: blackColor),
            ),
          ],
        ),
        TextButton(
            onPressed: ontap,
            child: Text(
              "See All",
              style: style16B.copyWith(color: primaryColor),
            )),
      ],
    ),
  );
}
