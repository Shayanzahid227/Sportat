// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/booking/field_details/check_out.dart';
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BookingFieldDetailsScreen extends StatefulWidget {
  @override
  State<BookingFieldDetailsScreen> createState() =>
      _BookingFieldDetailsScreenState();
}

class _BookingFieldDetailsScreenState extends State<BookingFieldDetailsScreen> {
  ///
  ///    3rd section
  ///
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  ///
  ///     part of fourth section
  ///
  final TextEditingController _addonController = TextEditingController();
  final List<String> _addons = [];
  final FocusNode _addonFocusNode = FocusNode();

  @override
  void dispose() {
    _addonController.dispose();
    _addonFocusNode.dispose();
    super.dispose();
  }

  ///
  ///
  ///
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscriptionViewModel(),
      child: Consumer<SubscriptionViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Column(
              children: [
                _topHeader(model),
                SizedBox(height: 180),
                _SecondSection(),
                20.verticalSpace,
                _ThirdSection(pickDate: _pickDate),
                20.verticalSpace,
                _fourthSection(),
                20.verticalSpace,
                _fifthSection(),
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
  ///       first section
  ///
  _topHeader(SubscriptionViewModel model) {
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
          bottom: 50,
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
          bottom: -150,
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
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
                            color: whiteColor,
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

  _SecondSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          CustomDropdownField(
            icon: Icons.male,
            hintText: 'select gender',
            labelText: "select Gender",
            items: ["Male", "Female", "Other"],
          ),
          10.verticalSpace,
          CustomDropdownField(
            icon: Icons.location_on_sharp,
            labelText: "Select Location",
            hintText: 'select location',
            items: ["Al-Maiaz", "Olaya"],
          ),
          10.verticalSpace,
          CustomDropdownField(
            icon: Icons.format_line_spacing_outlined,
            labelText: "Select Fields",
            hintText: 'select fields',
            items: ["Field 1 (11X11)", "Field 2 (9X9)"],
          ),
        ],
      ),
    );
  }

  ///
  ///      third section
  ///

  _ThirdSection({required Future<void> Function() pickDate}) {
    DateTime selectedDate = DateTime.now();

    final List<String> timeSlots = [
      '08:00 AM To 10:00 AM',
      '10:00 AM To 12:00 PM',
      '12:00 PM To 02:00 PM',
      '02:00 PM To 04:00 PM',
    ];
    //String? selectedSlot;
    String? selectedSlot = timeSlots[0]; // Select first slot by default

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor, width: 0.2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                  Container(
                    height: 46.h,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            //   onTap: pickDate,
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null && picked != selectedDate) {
                                setState(() {
                                  selectedDate = picked;
                                });
                              }
                            },

                            child: Text(
                              _formatDate(
                                  selectedDate), // use your custom format
                              style: style18B.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Time Slots Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 4,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: isSelected ? secondaryColor : Colors.white,
                            border: Border.all(
                              color: secondaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              slot,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color:
                                    isSelected ? Colors.white : Colors.black87,
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
  ///      fourth section
  ///
  _fourthSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primaryColor, width: 0.2),
            ),
            child: Column(
              children: [
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets().addons,
                        scale: 2.5,
                      ),
                      10.horizontalSpace,
                      Text(
                        'Addons',
                        style: style18B.copyWith(color: darkGreyColor),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150.w,
                        child: TextFormField(
                          controller: _addonController,
                          focusNode: _addonFocusNode,
                          decoration: InputDecoration(
                            hintText: '  Add Addons',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    BorderSide(color: borderColor, width: 0.5)),
                            contentPadding: const EdgeInsets.only(bottom: 12),
                          ),
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            if (value.trim().isNotEmpty) {
                              setState(() {
                                _addons.add(value.trim());
                                _addonController.clear();
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                if (_addons.isNotEmpty) ...[
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Wrap(
                      spacing: 8.w,
                      runSpacing: 18.h,
                      children: _addons.map((addon) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: primaryColor, width: 0.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                addon,
                                style: style14B.copyWith(color: whiteColor),
                              ),
                              10.horizontalSpace,
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _addons.remove(addon);
                                  });
                                },
                                child: Container(
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: whiteColor, width: 2)),
                                  child: Icon(
                                    Icons.close,
                                    size: 16.sp,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  10.verticalSpace,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///
  ///      _fifth Section
  ///
  _fifthSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 250.h,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor, width: 0.2)),
        child: Column(
          children: [
            50.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                children: [
                  _pricingDetail('Price', '100 SAR'),
                  20.verticalSpace,
                  _pricingDetail('Addons', '25 SAR'),
                  20.verticalSpace,
                  _pricingDetail('Earned', '100 Points', color: secondaryColor),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  ///     fourth section row of price and title
  ///
  Row _pricingDetail(String title, String price, {Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style14.copyWith(
            color: lightGreyColor,
          ),
        ),
        Text(
          price,
          style: style14.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}

class CustomDropdownField extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final String? hintText;
  final List<String> items;

  const CustomDropdownField({
    super.key,
    required this.icon,
    required this.labelText,
    this.hintText,
    required this.items,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedItem;

  Future<void> _showSelectionSheet(BuildContext context) async {
    final result = await showCustomSelectionBottomSheet(
      context: context,
      title: widget.labelText,
      options: widget.items,
    );

    if (result != null) {
      setState(() {
        selectedItem = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSelectionSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: lightGreyColor,
              size: 30,
            ),
            const SizedBox(width: 8),
            Text(
              widget.labelText,
              style: style16N.copyWith(
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
                border: Border.all(color: lightGreyColor, width: 0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedItem ?? widget.hintText ?? 'Select',
                        style: style16N.copyWith(
                          color: selectedItem != null
                              ? Colors.black87
                              : lightGreyColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
///     custom bottom sheet
///
Future<String?> showCustomSelectionBottomSheet({
  required BuildContext context,
  required String title,
  required List<String> options,
  String? currentSelection,
}) async {
  String? selectedValue = currentSelection;
  bool isItemSelected = false;

  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: style18.copyWith(),
                ),
                const SizedBox(height: 16),
                ...options.map((option) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedValue = option;
                          isItemSelected = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: lightGreyColor.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              option,
                              textAlign: TextAlign.center,
                              style: style16.copyWith(),
                            ),
                            if (selectedValue == option)
                              Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 16,
                                ),
                              ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Done',
                  onPressed: () {
                    Navigator.pop(context, selectedValue);
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      );
    },
  );

  return selectedValue;
}
