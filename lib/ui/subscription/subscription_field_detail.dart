import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/subscription/field_details/check_out.dart'
    show CheckOutScreen;
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SubscriptionFieldDetail extends StatefulWidget {
  const SubscriptionFieldDetail({super.key});

  @override
  State<SubscriptionFieldDetail> createState() =>
      _SubscriptionFieldDetailState();
}

class _SubscriptionFieldDetailState extends State<SubscriptionFieldDetail> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscribtionViewModel(),
      child: Consumer<SubscribtionViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Column(
              children: [
                _topHeader(model),
                SizedBox(height: 180),
                // _SecondSection(),
                20.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomButton(
                    text: 'Confirm Booking',
                    onPressed: () {
                      Get.to(CheckOutScreen());
                    },
                  ),
                ),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///      top header section
  ///
  _topHeader(SubscribtionViewModel model) {
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
                  model.currentIndex = index;
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(model.images[index]),
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
                        child: Icon(Icons.arrow_back, color: whitecolor)),
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
          bottom: 50,
          child: SmoothPageIndicator(
            controller: model.pageController,
            count: model.images.length,
            effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: whitecolor,
                activeDotColor: primaryColor),
          ),
        ),

        Positioned(
          bottom: -150,
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: whitecolor, borderRadius: BorderRadius.circular(20)),
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
                      "Champion Sports Club",
                      style: style20B,
                    ),

                    ///
                    /// Like
                    ///
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 37.w,
                          decoration: BoxDecoration(
                              color: blackColor.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Icon(
                            Icons.favorite_border,
                            color: whitecolor,
                          )),
                    )
                  ],
                ),
                20.verticalSpace,

                ///
                /// Location
                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _details(
                        icon: AppAssets().locationIcon,
                        title: 'Riyad Area',
                        onTap: () {}),
                    10.horizontalSpace,
                    _details(
                        icon: AppAssets().mapIcon,
                        title: 'location on the map',
                        onTap: () {})
                  ],
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _details(
                        icon: AppAssets().stareIcon,
                        title: 'available services',
                        onTap: () {}),
                    10.horizontalSpace,
                    _details(
                        icon: AppAssets().termsAndConditionIcon,
                        title: 'Terms and conditions',
                        onTap: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///
  ///     detail top header section part
  ///
  _details(
      {required String? icon,
      required String? title,
      required VoidCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: transparentColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(width: 1, color: lightGreyColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  icon!,
                  color: lightGreyColor,
                  scale: 5,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  "$title",
                  style: style14B,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
}
