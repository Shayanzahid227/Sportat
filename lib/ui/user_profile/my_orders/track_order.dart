import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            Text('shipping phase remain '),
            10.verticalSpace,
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
                  onTap: () {},
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
