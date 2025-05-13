import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/customer_support/customer_suppoet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(isBackButton: true, title: 'Track Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            const _OrderTimeline(),
            20.verticalSpace,
            _secondSection(),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(21),
                    ),
                    border: Border.all(color: Colors.red, width: 1.5),
                  ),
                  child: Text(
                    "Cancel Order",
                    style: style18.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    Get.to(CustomerSupportScreen());
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: primaryColor.withOpacity(0.3),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Image.asset(
                        AppAssets().helpIcon,
                        scale: 4,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }

  _secondSection() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: primaryColor, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Derails',
                style: style20.copyWith(color: darkGreyColor),
              ),
              10.verticalSpace,
              Text(
                'Address',
                style: style16.copyWith(color: lightGreyColor),
              ),
              10.verticalSpace,
              Text(
                '3910 Crim Lane, Greendale County, Colorado. Zip Code 410348',
                style: style12.copyWith(color: lightGreyColor),
              ),
              10.verticalSpace,
              Divider(),
              10.verticalSpace,
              Text(
                'Payment Method',
                style: style16.copyWith(color: lightGreyColor),
              ),
              10.verticalSpace,
              Text(
                'visa card ending in2024',
                style: style12.copyWith(color: lightGreyColor),
              ),
              Divider(),
              10.verticalSpace,
              Text(
                'Order Date',
                style: style16.copyWith(color: lightGreyColor),
              ),
              10.verticalSpace,
              Text(
                'March 29',
                style: style12.copyWith(color: lightGreyColor),
              ),
              10.verticalSpace,
              Divider(),
              10.verticalSpace,
              Text(
                'Items',
                style: style16.copyWith(color: lightGreyColor),
              ),
              10.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppAssets().screenStoreCategories1,
                          scale: 4,
                        ),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Men\'s tie-Dye T-Shirt',
                        style: style14.copyWith(color: darkGreyColor),
                      ),
                      5.verticalSpace,
                      Text(
                        'Nike SportsWear',
                        style: style14.copyWith(color: darkGreyColor),
                      ),
                      5.verticalSpace,
                      Text(
                        ' 300.22 SAR x 4',
                        style: style12.copyWith(color: primaryColor),
                      )
                    ],
                  ),
                ],
              ),
              10.verticalSpace,
              Divider(),
              10.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppAssets().screenStoreCategories3,
                          scale: 4,
                        ),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Men\'s tie-Dye T-Shirt',
                        style: style14.copyWith(color: darkGreyColor),
                      ),
                      5.verticalSpace,
                      Text(
                        'Nike SportsWear',
                        style: style14.copyWith(color: darkGreyColor),
                      ),
                      5.verticalSpace,
                      Text(
                        ' 300.22 SAR x 4',
                        style: style12.copyWith(color: primaryColor),
                      )
                    ],
                  ),
                ],
              ),
              10.verticalSpace,
              Divider(),
              _detailRow('Shipping', '10 SAR'),
              10.verticalSpace,
              _detailRow('Sub Total', '300 SAR'),
              10.verticalSpace,
              _detailRow('Energy Points', '100 Pints', textColor: primaryColor),
              10.verticalSpace,
              Divider(),
              10.verticalSpace,
              Row(
                children: [
                  Text(
                    'Total',
                    style: style16.copyWith(color: lightGreyColor),
                  ),
                  Spacer(),
                  Text(
                    '300 SAR',
                    style: style25B.copyWith(color: primaryColor),
                  )
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Row _detailRow(title, price, {Color? textColor}) {
    return Row(
      children: [
        Text(
          title,
          style: style14.copyWith(color: lightGreyColor),
        ),
        Spacer(),
        Text(
          price,
          style: style14N.copyWith(color: textColor ?? darkGreyColor),
        )
      ],
    );
  }
}

///
///
///     top section showing status of order
///
class _OrderTimeline extends StatelessWidget {
  const _OrderTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID : #123456',
            style: style14N.copyWith(color: darkGreyColor),
          ),

          // 1. Placed
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'April 15',
                      style: style12.copyWith(color: darkGreyColor),
                    ),
                    Text(
                      '12:05',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.10,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    height: 30,
                    indicator: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundColor: secondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.check,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  endChild: _TimelineItem(
                    title: 'Placed',
                    //dateTime: '',
                  ),
                  beforeLineStyle:
                      const LineStyle(color: secondaryColor, thickness: 5),
                ),
              ),
            ],
          ),

          // 2. Picked Up
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'April 15',
                      style: style12.copyWith(color: darkGreyColor),
                    ),
                    Text(
                      '12:05',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.10,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    height: 30,
                    indicator: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundColor: secondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.check,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    color: primaryColor,
                  ),
                  endChild: _TimelineItem(
                    title: 'Picked up',
                    //dateTime: '',
                  ),
                  beforeLineStyle:
                      const LineStyle(color: secondaryColor, thickness: 5),
                  afterLineStyle:
                      const LineStyle(color: secondaryColor, thickness: 5),
                ),
              ),
            ],
          ),

          // 3. On the way
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'April 15',
                      style: style12.copyWith(color: darkGreyColor),
                    ),
                    Text(
                      '12:05',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.10,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    height: 30,
                    indicator: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              backgroundColor: secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    color: whiteColor,
                  ),
                  endChild: _TimelineItem(
                    title: 'On the way',
                    //dateTime: '',
                  ),
                  beforeLineStyle:
                      const LineStyle(color: secondaryColor, thickness: 5),
                  afterLineStyle: LineStyle(
                    color: lightGreyColor.withOpacity(0.4),
                    thickness: 5,
                  ),
                ),
              ),
            ],
          ),

          // 4. Delivered
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'April 15',
                      style: style12.copyWith(color: darkGreyColor),
                    ),
                    Text(
                      '12:05',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.10,
                  isLast: true,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    height: 30,
                    indicator: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                          backgroundColor: lightGreyColor,
                        ),
                      ),
                    ),
                  ),
                  endChild: _TimelineItem(
                    title: 'Delivered',
                    //  dateTime: '',
                    isCompleted: false,
                  ),
                  beforeLineStyle: LineStyle(
                    color: lightGreyColor.withOpacity(0.4),
                    thickness: 5,
                  ),
                  afterLineStyle: LineStyle(
                    color: lightGreyColor.withOpacity(0.4),
                    thickness: 5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.title,
    this.dateTime,
    this.isCompleted = true,
  });

  final String title;
  final String? dateTime;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: style18.copyWith(
              fontWeight: FontWeight.w500,
              color: isCompleted ? darkGreyColor : Colors.grey[600],
            ),
          ),
          // 5.verticalSpace,
          // Text(
          //   dateTime ?? '',
          //   style: style12.copyWith(color: Colors.grey),
          // ),
        ],
      ),
    );
  }
}
