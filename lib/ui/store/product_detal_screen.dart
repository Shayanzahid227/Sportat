import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/custom_new_arrivals.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:code_structure/ui/store/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _IsSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void OnClick() {
    setState(() {
      _IsSelected = !_IsSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreViewModel(),
      child: Consumer2<StoreViewModel, RootViewModel>(
        builder: (context, storeModel, rootModel, child) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                _topHeader(storeModel),
                280.verticalSpace,
                _secondSection(),
                20.verticalSpace,
                _thirdSection(storeModel),
                100.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///       top header  section
  ///
  _topHeader(StoreViewModel model) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          children: [
            ///
            /// Slider Images
            ///
            SizedBox(
              height: 250.h,
              child: PageView.builder(
                controller: model.pageController,
                itemCount: model.images.length,
                onPageChanged: (index) {
                  model.productCurrentIndex = index;
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          model.images[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///
                  /// Back Arrow
                  ///
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 36.h,
                        width: 37.w,
                        decoration: BoxDecoration(
                            color: blackColor.withOpacity(0.60),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Icon(Icons.arrow_back, color: whiteColor)),
                  ),

                  ///
                  /// Share
                  ///
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 36.h,
                      width: 37.w,
                      decoration: BoxDecoration(
                          color: blackColor.withOpacity(0.60),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Image.asset(
                        AppAssets().share,
                        scale: 5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        /// Page Indicator
        Positioned(
          bottom: 30,
          child: SmoothPageIndicator(
            controller: model.pageController,
            count: model.images.length,
            effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: whiteColor,
                activeDotColor: primaryColor),
          ),
        ),

        Positioned(
          bottom: -280,
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            //width: double.infinity.w,
            width: 420,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///
                    /// Title
                    ///
                    Text(
                      "Men's Tie-Dye T-Shirt Nike ",
                      style: style20B,
                    ),

                    ///
                    /// points earn
                    ///
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets().pointsEarnIcon,
                            scale: 4,
                          ),
                          2.horizontalSpace,
                          Text(
                            '100K',
                            style: style16.copyWith(color: secondaryColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'sold by',
                      style: style18.copyWith(color: borderColor),
                    ),
                    10.horizontalSpace,
                    CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 20,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(AppAssets().acIcon)),
                    ),
                    10.horizontalSpace,
                    Text(
                      'Store name',
                      style: style18.copyWith(),
                    )
                  ],
                ),
                10.verticalSpace,
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: primaryColor, width: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Color',
                          style: style20B,
                        ),
                        Row(
                          children: [
                            _itemColor(AppAssets().storeCategories2),
                            5.horizontalSpace,
                            _itemColor(AppAssets().storeCategories1),
                            5.horizontalSpace,
                            _itemColor(AppAssets().storeCategories3)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: primaryColor, width: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Color',
                          style: style20B,
                        ),
                        Row(
                          children: [
                            _itemSize('Xl'),
                            5.horizontalSpace,
                            _itemSize('XXL'),
                            5.horizontalSpace,
                            _itemSize('XXL')
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///     product color used in top header section
  ///
  _itemColor(String? image) {
    return GestureDetector(
      onTap: () {
        OnClick();
      },
      child: Container(
        height: 50.h,
        width: 60.w,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(
                color: _IsSelected ? secondaryColor : transparentColor,
                width: 3),
            borderRadius: BorderRadius.circular(50.r)),
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Image.asset(
            image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  ///
  ///      product size used in top header section
  Container _itemSize(String? size) {
    return Container(
      height: 50.h,
      width: 60.w,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: secondaryColor, width: 3),
          borderRadius: BorderRadius.circular(50.r)),
      child: Padding(
          padding: EdgeInsets.all(3),
          child: Center(
            child: Text(
              size!,
              style: style18B,
            ),
          )),
    );
  }

  ///
  ///      second section about details
  ///
  _secondSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: blackColor,
          )
        ],
      ),
    );
  }

  ///
  ///      3rd section
  ///
  _thirdSection(StoreViewModel storeModel) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: storeModel.sellingProducts.length,
          itemBuilder: (context, index) {
            return CustomNewArrivals(
              newArrivalsModel: storeModel.sellingProducts[index],
              addCartOnTap: () {},
            );
          }),
    );
  }

  ///
  ///      main bracket
  ///
}
