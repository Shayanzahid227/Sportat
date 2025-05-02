import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/home/home_screen.dart';
import 'package:code_structure/ui/booking/field_details/field_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ConfirmedBookingScreen extends StatelessWidget {
  const ConfirmedBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
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
                  _TopHeader()
                ],
              ),
              30.verticalSpace,
              _firstSection(),
              20.verticalSpace,
              _secondSection(),
              20.verticalSpace,
              CustomButton(
                  text: 'Go To My Bookings',
                  onPressed: () {
                    Get.to(FieldDetailsScreen());
                  }),
              20.verticalSpace,
              CustomButton(
                text: 'Back To Home',
                onPressed: () {
                  Get.to(HomeScreen());
                },
                boxColor: whitecolor,
                textColor: blackColor,
              ),
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
      width: double.infinity,
      decoration: BoxDecoration(
          color: whitecolor,
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
