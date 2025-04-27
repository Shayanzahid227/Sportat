// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FieldDetailsScreen extends StatelessWidget {
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
                SizedBox(
                    height:
                        180), // <-- to adjust because _topHeader has negative Positioned
                _Secondsection(), // <-- add your dropdown section here
                20.verticalSpace,
                _ThirdSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
///       first section
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
///      second section
///

_Secondsection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      children: [
        CustomDropdownField(
          icon: Icons.male,
          labelText: "Player's Gender",
          items: ["Male", "Female", "Other"], // <-- dynamic list
        ),
        10.verticalSpace,
        CustomDropdownField(
          icon: Icons.location_on_sharp,
          labelText: "Select Location",
          items: ["Male", "Female", "Other"], // <-- dynamic list
        ),
        10.verticalSpace,
        CustomDropdownField(
          icon: Icons.format_line_spacing_outlined,
          labelText: "Select Fields",
          items: ["Male", "Female", "Other"], // <-- dynamic list
        ),
      ],
    ),
  );
}

///
///      third section
///
// Add this method for the third section
_ThirdSection() {
  // Sample data - in a real app, this would come from your ViewModel
  final DateTime selectedDate = DateTime(2024, 3, 12);
  final List<String> timeSlots = [
    '08:00 AM To 10:00 AM',
    '10:00 AM To 12:00 PM',
    '12:00 PM To 02:00 PM',
    '02:00 PM To 04:00 PM',
  ];
  String? selectedSlot;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 240,
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primaryColor, width: 0.5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined),
                    10.horizontalSpace,
                    Text(
                      'Date And Available Slot',
                      style: style16B.copyWith(
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Date Display
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 46.h,
                    decoration: BoxDecoration(
                      color: Color(0xffF3F5FA),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(color: primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Text(
                //   _formatDate(selectedDate),
                //   style: TextStyle(
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black87,
                //   ),
                // ),
                // const SizedBox(height: 20),

                // Time Slots Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 5,
                  ),
                  itemCount: timeSlots.length,
                  itemBuilder: (context, index) {
                    final slot = timeSlots[index];
                    final isSelected = selectedSlot == slot;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSlot = isSelected ? null : slot;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? primaryColor : Colors.white,
                          border: Border.all(
                            color: isSelected ? primaryColor : lightGreyColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            slot,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Add this helper method to format the date
String _formatDate(DateTime date) {
  final day = date.day;
  String suffix;

  if (day >= 11 && day <= 13) {
    suffix = 'th';
  } else {
    switch (day % 10) {
      case 1:
        suffix = 'st';
        break;
      case 2:
        suffix = 'nd';
        break;
      case 3:
        suffix = 'rd';
        break;
      default:
        suffix = 'th';
    }
  }

  final monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  return '${day}$suffix ${monthNames[date.month - 1]} ${date.year}';
}

///
///      custom drop down field
///
class CustomDropdownField extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final List<String> items;

  const CustomDropdownField({
    super.key,
    required this.icon,
    required this.labelText,
    required this.items,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(widget.icon, color: Colors.black87),
          const SizedBox(width: 8),
          Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Container(
            height: 36.h,
            width: 144.w,
            decoration: BoxDecoration(
                border: Border.all(color: lightGreyColor),
                borderRadius: BorderRadius.circular(10.r)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Select Gender",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                ),
                value: selectedItem,
                items: widget.items.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
