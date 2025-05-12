import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qr_flutter/qr_flutter.dart';

class SubscriptionDetailScreen extends StatelessWidget {
  const SubscriptionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(isBackButton: true, title: 'Booking Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.verticalSpace,
              30.verticalSpace,
              _firstSection(),
              20.verticalSpace,
              _secondSection(),
              20.verticalSpace,
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///      top header of booking confirmed
  ///
  Column _TopHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        20.verticalSpace,
        Text(
          'Booking',
          style: style25B.copyWith(fontSize: 28.sp, color: blackColor),
        ),
        Text(
          'Confirmed',
          style: style25B.copyWith(fontSize: 42.sp, color: primaryColor),
        ),
      ],
    );
  }

  _firstSection() {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text('Subscription Summery',
                style: style25B.copyWith(
                  color: darkGreyColor,
                )),
            30.verticalSpace,
            _pricingDetail('Subscription Name', 'Monthly Membership'),
            20.verticalSpace,
            Divider(
              color: lightGreyColor3,
              thickness: 1,
            ),
            _pricingDetail('SubTotal', '100 SAR'),
            20.verticalSpace,
            _pricingDetail('Earned Points', '100 Points',
                color: secondaryColor),
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

  ///
  ///      second section of payment method
  ///
  _secondSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: primaryColor, width: 0.5),
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Access QR Code',
                    style: style16B,
                  ),
                  20.verticalSpace,
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(21)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets().shareIcon,
                              scale: 4,
                            ),
                            10.horizontalSpace,
                            Text(
                              'Share',
                              style: style16,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                // Image.asset(AppAssets().appleIcon),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: QrImageView(
                    data: "https://example.com", // The data to encode
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),

                Text(
                  'SR:1234567890',
                  style: style14,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
