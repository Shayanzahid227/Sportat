import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmedBookingScreen extends StatelessWidget {
  const ConfirmedBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            30.verticalSpace,
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      AppAssets().confirmedBooking,
                      scale: 3,
                    )
                  ],
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Text(
                      'Booking',
                      style:
                          style25B.copyWith(fontSize: 28.sp, color: blackColor),
                    ),
                    Text(
                      'Confirmed',
                      style: style25B.copyWith(
                          fontSize: 42.sp, color: primaryColor),
                    ),
                  ],
                )
              ],
            ),
            30.verticalSpace,
            _firstSection(),
            _secondSection()
          ],
        ),
      ),
    );
  }

  _firstSection() {
    return Container(
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
            _pricingDetail('Players Gender', 'male'),
            20.verticalSpace,
            _pricingDetail('Location', 'AL-Malaz'),
            20.verticalSpace,
            _pricingDetail('Field', 'Field 1 (11X11)'),
            20.verticalSpace,
            _pricingDetail('Date', '12th March 2024'),
            20.verticalSpace,
            _pricingDetail(
              'Time',
              '08:00 AM to 10:00 AM',
            ),
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
  ///      second section of payment method
  ///
  _secondSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Access QR Code',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 68.25,
              height: 68.25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Placeholder(), // Replace with actual QR code widget
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets().shareIcon),
              const SizedBox(width: 8),
              const Text(
                'Share',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              '68.25 × 68.25',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
