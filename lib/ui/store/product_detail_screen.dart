// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/custom_new_arrivals.dart';
import 'package:code_structure/ui/store/cart/cart_screen.dart';
import 'package:code_structure/ui/store/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreViewModel(),
      child: Consumer<StoreViewModel>(
        builder: (context, storeModel, child) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            _sliderImages(storeModel),
                            _icons(),

                            // Indicator placed at bottom center over the slider images
                            Positioned(
                              bottom: 10, // adjust as needed
                              left: 0,
                              right: 0,
                              child: Center(
                                child: _indicator(storeModel),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          width: double.infinity.w,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          style: style16.copyWith(
                                              color: secondaryColor),
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
                                    style: style18.copyWith(color: bordrColor),
                                  ),
                                  10.horizontalSpace,
                                  CircleAvatar(
                                      backgroundColor: whiteColor,
                                      radius: 20,
                                      backgroundImage:
                                          AssetImage(AppAssets().onlineShop)),
                                  10.horizontalSpace,
                                  Text(
                                    'Store name',
                                    style: style18.copyWith(),
                                  )
                                ],
                              ),
                              10.verticalSpace,

                              ///
                              /// Product Colors
                              ///
                              _productColors(storeModel),
                              10.verticalSpace,

                              ///
                              /// Product Sizes
                              ///
                              Container(
                                height: 80,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(
                                      color: primaryColor, width: 0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Size',
                                      style: style20,
                                    ),
                                    Spacer(),
                                    _itemSize('Xl', storeModel),
                                    5.horizontalSpace,
                                    _itemSize('XLL', storeModel),
                                    5.horizontalSpace,
                                    _itemSize('XXL', storeModel),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        ///
                        /// Description
                        ///
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(width: 0.5, color: primaryColor),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: style18B,
                              ),
                              10.verticalSpace,
                              ReadMoreText(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur velit at massa vehicula, quis fringilla urna gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. Integer posuere, sapien nec lacinia hendrerit, orci justo facilisis risus, nec tincidunt erat diam in sapien.",
                                style: style14N.copyWith(color: blackColor),
                                trimLines: 3,
                              ),
                            ],
                          ),
                        ),

                        ///
                        /// Expansion
                        ///
                        ExpanstionCards(
                          fullText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur velit at massa vehicula, quis fringilla urna gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. Integer posuere, sapien nec lacinia hendrerit, orci justo facilisis risus, nec tincidunt erat diam in sapien.',
                          title: 'Return Options',
                          imgIcon: AppAssets().returnOption,
                        ),

                        ExpanstionCards(
                          fullText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur velit at massa vehicula, quis fringilla urna gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. Integer posuere, sapien nec lacinia hendrerit, orci justo facilisis risus, nec tincidunt erat diam in sapien.',
                          title: 'Purchase Policy',
                          imgIcon: AppAssets().privacy,
                        ),

                        20.verticalSpace,
                        SizedBox(
                          height: 220.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: storeModel.sellingProducts.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => ProductDetailScreen());
                                  },
                                  child: CustomNewArrivals(
                                    newArrivalsModel:
                                        storeModel.sellingProducts[index],
                                    addCartOnTap: () {
                                      Get.to(CartScreen());
                                    },
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),

                    ///
                    /// View Cart
                    ///
                    Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.5.r),
                        color: secondaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            AppAssets().viewCart,
                            color: whiteColor,
                            scale: 3,
                          ),
                          Text(
                            "View Cart",
                            style: style16B.copyWith(color: whiteColor),
                          ),
                          CircleAvatar(
                            backgroundColor: whiteColor,
                            radius: 16.r,
                            child: Text(
                              "4",
                              style: style16B.copyWith(color: secondaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ProductBottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///      product size used in top header section
  Widget _itemSize(String size, StoreViewModel model) {
    final isSelected = model.selectedSize == size;
    return GestureDetector(
      onTap: () => model.selectSize(size),
      child: Container(
        height: 50.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: isSelected ? transparentColor : Colors.grey.shade200,
          border: Border.all(
            color: isSelected ? secondaryColor : transparentColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(size, style: style18B),
        ),
      ),
    );
  }

  _sliderImages(StoreViewModel storeModel) {
    return SizedBox(
      height: 250.h,
      child: PageView.builder(
        controller: storeModel.pageController,
        itemCount: storeModel.images.length,
        onPageChanged: (index) {
          storeModel.productCurrentIndex = index;
        },
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  storeModel.images[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  _icons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
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
                AppAssets().heartIcon,
                scale: 5,
              ),
            ),
          )
        ],
      ),
    );
  }

  _indicator(StoreViewModel storeModel) {
    return SmoothPageIndicator(
      controller: storeModel.pageController,
      count: storeModel.images.length,
      effect: ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          dotColor: whiteColor,
          activeDotColor: primaryColor),
    );
  }

  _productColors(StoreViewModel storeModel) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: primaryColor, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Color',
              style: style20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    storeModel.selectColor(0);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: storeModel.selectedColorIndex == 0
                          ? transparentColor
                          : Colors.grey.shade200,
                      border: Border.all(
                        color: storeModel.selectedColorIndex == 0
                            ? secondaryColor
                            : transparentColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset(
                      AppAssets().screenStoreCategories5,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    storeModel.selectColor(1);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: storeModel.selectedColorIndex == 1
                          ? transparentColor
                          : Colors.grey.shade200,
                      border: Border.all(
                        color: storeModel.selectedColorIndex == 1
                            ? secondaryColor
                            : transparentColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset(
                      AppAssets().screenStoreCategories6,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    storeModel.selectColor(2);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: storeModel.selectedColorIndex == 2
                          ? transparentColor
                          : Colors.grey.shade200,
                      border: Border.all(
                        color: storeModel.selectedColorIndex == 2
                            ? secondaryColor
                            : transparentColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset(
                      AppAssets().screenStoreCategories2,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? style;

  const ReadMoreText({
    required this.text,
    this.trimLines = 3,
    this.style,
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final span = TextSpan(text: widget.text, style: widget.style);
      final tp = TextPainter(
        text: span,
        maxLines: widget.trimLines,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: constraints.maxWidth);

      final isOverflowing = tp.didExceedMaxLines;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            maxLines: _readMore ? widget.trimLines : null,
            overflow: _readMore ? TextOverflow.ellipsis : TextOverflow.visible,
            style: widget.style,
          ),
          if (isOverflowing)
            GestureDetector(
              onTap: () => setState(() => _readMore = !_readMore),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _readMore ? 'Read more' : 'Read less',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            )
        ],
      );
    });
  }
}

class ExpanstionCards extends StatefulWidget {
  final String? title;
  final String? fullText;
  final String? imgIcon;
  const ExpanstionCards(
      {required this.fullText, required this.title, required this.imgIcon});

  @override
  State<ExpanstionCards> createState() => _ExpanstionCardsState();
}

class _ExpanstionCardsState extends State<ExpanstionCards> {
  bool _isExpanded = false;
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5, color: primaryColor),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: _isExpanded,
          tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          childrenPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          leading: Image.asset(
            "${widget.imgIcon}",
            scale: 3,
          ),
          title: Text(
            '${widget.title}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          trailing: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 28.sp,
            color: Colors.black87,
          ),
          onExpansionChanged: (value) => setState(() => _isExpanded = value),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _readMore
                      ? widget.fullText!.substring(0, 120) + '...'
                      : widget.fullText!,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
                SizedBox(height: 4.h),
                GestureDetector(
                  onTap: () => setState(() => _readMore = !_readMore),
                  child: Text(
                    _readMore ? 'Read more' : 'Read less',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductBottomBar extends StatefulWidget {
  const ProductBottomBar({super.key});

  @override
  State<ProductBottomBar> createState() => _ProductBottomBarState();
}

class _ProductBottomBarState extends State<ProductBottomBar> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(color: whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Text(
                "421 SAR",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),

              // Quantity Controls
              Row(
                children: [
                  // Minus Button
                  InkWell(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Center(
                        child: Icon(Icons.remove, color: whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),

                  // Quantity Text
                  Text(
                    "$quantity",
                    style: style18,
                  ),
                  SizedBox(width: 10.w),

                  // Plus Button
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: whiteColor),
                      ),
                    ),
                  ),
                ],
              ),

              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => CartScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
                ),
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
