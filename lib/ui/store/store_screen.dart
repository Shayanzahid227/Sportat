// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/home_slider_model.dart';
import 'package:code_structure/custom_widgets/bottom_sheet/search_filter_bottom_sheet.dart';
import 'package:code_structure/custom_widgets/custom_new_arrivals.dart';
import 'package:code_structure/custom_widgets/sportat/home_store_categories.dart';
import 'package:code_structure/ui/notification/notification_screen.dart';
import 'package:code_structure/ui/search/search_screen.dart';
import 'package:code_structure/ui/store/cart/cart_screen.dart';
import 'package:code_structure/ui/store/limited_offers/limited_offers_screen.dart';
import 'package:code_structure/ui/store/new_arrivals/new_arrivals_screen.dart';
import 'package:code_structure/ui/store/product_detail_screen.dart';
import 'package:code_structure/ui/store/store_view_model.dart';
import 'package:code_structure/ui/store/top_selling_products/top_selling_screen.dart';
import 'package:code_structure/ui/store/top_stores/top_stores_screen.dart';
import 'package:code_structure/ui/store_categories_screen/store_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/route_manager.dart';
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
                  _sliderSection(),
                  _storeCategories(model),

                  ///
                  /// Arrivals
                  ///
                  _iconAndText(
                    img: AppAssets().arrival,
                    title: "New Arrivals",
                    ontap: () {
                      Get.to(NewArrivalsScreen());
                    },
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.newArrivalsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(ProductDetailScreen());
                            },
                            child: CustomNewArrivals(
                              newArrivalsModel: model.newArrivalsList[index],
                              addCartOnTap: () {
                                Get.to(CartScreen());
                              },
                            ),
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
                    ontap: () {
                      Get.to(TopStoresScreen());
                    },
                  ),
                  SizedBox(
                    height: 80.h,
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
                                color: whiteColor,
                                border:
                                    Border.all(width: 0.3, color: primaryColor),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                "${model.topStoresList[index].imgUrl}",
                                scale: 3,
                              ),
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
                    ontap: () {
                      Get.to(TopSellingScreen());
                    },
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.sellingProducts.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(ProductDetailScreen());
                            },
                            child: CustomNewArrivals(
                              newArrivalsModel: model.sellingProducts[index],
                              addCartOnTap: () {
                                Get.to(CartScreen());
                              },
                            ),
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
                    ontap: () {
                      Get.to(LimitedOffersScreen());
                    },
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.limitedProducts.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(ProductDetailScreen());
                            },
                            child: CustomNewArrivals(
                              newArrivalsModel: model.limitedProducts[index],
                              addCartOnTap: () {
                                Get.to(CartScreen());
                              },
                            ),
                          );
                        }),
                  ),
                  70.verticalSpace,
                ],
              ),
            )),
      ),
    );
  }
}

///************************
///    app bar end ///
/// ***********************

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
                                ? secondaryColor
                                : whiteColor,
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
        color: whiteColor,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'Discover ',
          style:
              style20N.copyWith(fontFamily: 'Antonio', color: secondaryColor),
        ),
        TextSpan(
          text: 'Top Brands at Unbeatable Prices and Exclusive ',
          style: style20N.copyWith(fontFamily: 'Antonio', color: whiteColor),
        ),
        TextSpan(
          text: 'Offers',
          style:
              style20N.copyWith(fontFamily: 'Antonio', color: secondaryColor),
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
              style: style20B.copyWith(color: blackColor),
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
        ontap: () {
          Get.to(StoreCategoriesScreen());
        },
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

AppBar _appBar(BuildContext context, StoreViewModel model) {
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

_searchField(BuildContext context, StoreViewModel model) {
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
