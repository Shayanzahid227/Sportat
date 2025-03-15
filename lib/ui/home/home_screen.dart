// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_slider_model.dart';
import 'package:code_structure/custom_widgets/sportat/home_sport_categories.dart';
import 'package:code_structure/custom_widgets/sportat/home_store_categories.dart';
import 'package:code_structure/custom_widgets/sportat/home_top_10_fields.dart';
import 'package:code_structure/custom_widgets/sportat/home_top_subscriptions.dart';
import 'package:code_structure/ui/home/home_view_model.dart';
import 'package:code_structure/ui/store_categories_screen/store_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,

          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Column(
              children: [
                _sliderSection(),
                _sportCategories(model),
                10.verticalSpace,
                _topSubScriptions(model, context),
                10.verticalSpace,
                _top10Fields(model, context),
                10.verticalSpace,
                _storeCategories(model),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
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
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
          style: style20N.copyWith(fontFamily: 'Antonio', color: secondryColor),
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
          style: style20N.copyWith(fontFamily: 'Antonio', color: secondryColor),
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
        ontap: () {
          Get.to(CategoriesScreen());
        },
      ),
      5.verticalSpace,
      SizedBox(
        height: 200.h,
        width: double.infinity,
        child: ListView.builder(
          controller: model.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: model.sportCategoriesList.length,
          itemBuilder: (BuildContext context, int index) {
            // int randomIndex = random.nextInt(model.sliderGradients.length);
            return GestureDetector(
              onTap: () {
                Get.to(CategoriesScreen());
              },
              child: CustomSportCategory(
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
      10.verticalSpace,
      SizedBox(
        height: 140.h,
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
        height: 140.h,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset(
                img!,
                scale: 3,
              ),
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
