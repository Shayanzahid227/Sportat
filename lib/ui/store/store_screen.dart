// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_slider_model.dart';
import 'package:code_structure/custom_widgets/custom_new_arrivals.dart';
import 'package:code_structure/custom_widgets/sportat/home_store_categories.dart';
import 'package:code_structure/ui/store/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreViewModel(),
      child: Consumer<StoreViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: backGroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _sliderSection(),
                  _storeCategories(model),

                  ///
                  /// Arrivals
                  ///
                  _iconAndText(
                    img: AppAssets().arrival,
                    title: "New Arrivals",
                    ontap: () {},
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.newArrivalsList.length,
                        itemBuilder: (context, index) {
                          return CustomNewArrivals(
                            newArrivalsModel: model.newArrivalsList[index],
                            addCartOnTap: () {},
                          );
                        }),
                  ),
                  10.verticalSpace,

                  ///
                  /// Top Stores
                  ///
                  _iconAndText(
                    img: AppAssets().store,
                    title: "Top Stores",
                    ontap: () {},
                  ),
                  SizedBox(
                    height: 70.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.topStoresList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(6),
                            width: 70,
                            decoration: BoxDecoration(
                                color: whitecolor,
                                border:
                                    Border.all(width: 0.4, color: primaryColor),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Image.asset(
                              "${model.topStoresList[index].imgUrl}",
                              scale: 3,
                            ),
                          );
                        }),
                  ),
                  10.verticalSpace,

                  ///
                  /// Arrivals
                  ///
                  _iconAndText(
                    img: AppAssets().arrival,
                    title: "Top Selling Products",
                    ontap: () {},
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.sellingProducts.length,
                        itemBuilder: (context, index) {
                          return CustomNewArrivals(
                            newArrivalsModel: model.sellingProducts[index],
                            addCartOnTap: () {},
                          );
                        }),
                  ),
                  10.verticalSpace,

                  ///
                  /// Limited Time Offer
                  ///
                  _iconAndText(
                    img: AppAssets().limitedTimeoffer,
                    title: "Limitted Time Offers!",
                    ontap: () {},
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.limitedProducts.length,
                        itemBuilder: (context, index) {
                          return CustomNewArrivals(
                            newArrivalsModel: model.limitedProducts[index],
                            addCartOnTap: () {},
                          );
                        }),
                  ),
                  10.verticalSpace,
                ],
              ),
            )),
      ),
    );
  }
}

Widget _sliderSection() {
  return Consumer<StoreViewModel>(builder: (context, model, child) {
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
          itemCount: model.sliders.length,
          onIndexChanged: (index) {
            model.setCurrentIndex(index);
          },
          itemBuilder: (context, index) {
            final slider = model.sliders[index];
            return Transform.flip(
              flipY: true,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: MediaQuery.of(context).size.width - 32.w,
                    decoration: BoxDecoration(
                      color: blackColor,
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
                        model.sliders.length,
                        (indicatorIndex) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: model.currentIndex == indicatorIndex
                              ? 34.w
                              : 24.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: model.currentIndex == indicatorIndex
                                ? secondryColor
                                : whitecolor,
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
        color: whitecolor,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'Discover ',
          style: style20N.copyWith(fontFamily: 'Antonio', color: secondryColor),
        ),
        TextSpan(
          text: 'Top Brands at Unbeatable Prices and Exclusive ',
          style: style20N.copyWith(fontFamily: 'Antonio', color: whitecolor),
        ),
        TextSpan(
          text: 'Offers',
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
        child: Image.asset(AppAssets().ellipse, height: 140),
      ),
      Image.asset(imageUrl!),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset(
                img!,
                height: 20.h,
                width: 20.w,
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

_storeCategories(StoreViewModel model) {
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
