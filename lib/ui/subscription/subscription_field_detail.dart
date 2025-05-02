import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/subscription_membership_card.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/custom_widgets/sportat/subscription_membership_card.dart';
import 'package:code_structure/ui/booking/field_details/field_details_screen.dart';
import 'package:code_structure/ui/subscription/subscription_check_out.dart';
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
  int selectedMembershipIndex = 0; // Track selected membership index
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
                //  CustomMembershipCard(),

                _SecondSection(), 30.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomDropdownField(
                    icon: Icons.male,
                    hintText: 'select gender',
                    labelText: "select Gender",
                    items: ["Male", "Female", "Other"],
                  ),
                ),
                20.verticalSpace,
                _lastSection(),
                20.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomButton(
                    text: 'Confirm Subscription',
                    onPressed: () {
                      // showServicesBottomSheet(context);
                      Get.to(SubscriptionCheckoutScreen());
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
                        onTap: () {
                          ///
                          ///     just for checking
                          ///
                          showServicesBottomSheet(context);
                        }),
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
  ///     second section of payment method
  ///
  Widget _SecondSection() {
    final List<MembershipCardModel> membershipsCategory = [
      MembershipCardModel(
        title: 'Monthly Membership',
        color: lightGreyColor,
        price: 300,
        points: 1000,
        description:
            'Unlimited Access To All Facilities Including Gym,Pool, And Fitness Classes',
      ),
      MembershipCardModel(
        title: 'Quarterly Membership',
        price: 750,
        points: 3000,
        description:
            'Unlimited Access To All Facilities Including Gym,Pool, And Fitness Classes',
      ),
      MembershipCardModel(
        title: 'Annual Membership',
        price: 2800,
        color: Color(0xffEF4D57),
        points: 5000,
        description:
            'Unlimited Access To All Facilities Including Gym,Pool, And Fitness Classes',
      ),
      MembershipCardModel(
        title: 'Family Membership',
        price: 4500,
        points: 9000,
        color: secondaryColor,
        description:
            'Unlimited Access For Up To 4Family Members Including Gym,Pool, And Fitness Classes',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 50.h,
              childAspectRatio: 0.72,
            ),
            itemCount: membershipsCategory.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMembershipIndex = index;
                  });
                },
                child: Stack(
                  clipBehavior: Clip.none, // Add this line
                  children: [
                    CustomMembershipCard(
                      membership: membershipsCategory[index],
                    ),
                    if (selectedMembershipIndex == index)
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.25,
                        right: MediaQuery.of(context).size.width * 0.18,
                        child: Container(
                          width: 56, // Reduced size for better fit
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  ///
  ///    subscription pricing detail last section of this page
  ///
  _lastSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor, width: 0.2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text('booking summery',
                  style: style25B.copyWith(
                    color: darkGreyColor,
                  )),
              30.verticalSpace,
              _pricingDetail('Plan', 'Monthly Membership'),
              20.verticalSpace,
              _pricingDetail('Price', '300 SAR'),
              20.verticalSpace,
              _pricingDetail('Energy Points', '100 Points',
                  color: secondaryColor),
              20.verticalSpace,
              Divider(
                color: lightGreyColor3,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total price',
                    style: style18B.copyWith(
                      color: blackColor,
                    ),
                  ),
                  Text(
                    '325 SAR',
                    style: style25B.copyWith(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///     first section row of price and title
  ///
  Row _pricingDetail(String title, String price, {Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style16.copyWith(
            color: lightGreyColor,
          ),
        ),
        Text(
          price,
          style: style16B.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }

  ///
  ///      available services bottom sheet
  ///
  ///
  /// Bottom Sheet for Available Services
  ///
  void showServicesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 32.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              16.verticalSpace,

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text(
                      'Available Services',
                      style: style18B.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigator?.pop(context);
                      },
                      child: Icon(Icons.cancel_outlined,
                          color: lightGreyColor, size: 30.sp),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAvailableServicesItem(
                      image: AppAssets().acIcon,
                      title: 'Air\nConditioning',
                    ),
                    CustomAvailableServicesItem(
                      image: AppAssets().blueFootBallIcon,
                      title: 'Ball',
                    ),
                    CustomAvailableServicesItem(
                      image: AppAssets().botleIcon,
                      title: 'Water',
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAvailableServicesItem(
                      image: AppAssets().kitIcon,
                      title: 'Clothes',
                    ),
                    CustomAvailableServicesItem(
                      image: AppAssets().carIcon,
                      title: 'Parking',
                    ),
                    CustomAvailableServicesItem(
                      image: AppAssets().showerIcon,
                      title: 'Shower',
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  ///
  ///
  ///     last bracket
  ///
}

class CustomAvailableServicesItem extends StatelessWidget {
  final String? image;
  final String? title;
  const CustomAvailableServicesItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.r),
              border: Border.all(width: 0.5)),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(21)),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                    image!,
                    scale: 3,
                  ),
                ),
              )
            ],
          ),
        ),
        5.verticalSpace,
        Text(title!,
            textAlign: TextAlign.center,
            style: style14B.copyWith(
              color: blackColor,
            )),
      ],
    );
  }
}
