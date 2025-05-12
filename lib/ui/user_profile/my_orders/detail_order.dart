import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/route_manager.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  TextEditingController _feedbackController = TextEditingController();
  double _rating = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(isBackButton: true, title: 'Order Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            10.verticalSpace,
            _TopHeader(),
            GestureDetector(
              onTap: () {
                _bottomSheet(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(21),
                    ),
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: Text(
                    "Submit Review",
                    style: style18.copyWith(color: primaryColor),
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

  Widget _TopHeader() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: primaryColor, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking Summery',
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

  ///
  ///      bottom sheet
  ///
  _bottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomSheetSetState) {
            return rateExperienceBottomSheet(
              context,
              feedbackController: _feedbackController,
              currentRating: _rating,
              onRatingChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
                bottomSheetSetState(() {});
              },
            );
          },
        );
      },
    );
  }

  ///
  ///      bottom sheet widget
  ///
  Widget rateExperienceBottomSheet(BuildContext context,
      {required TextEditingController feedbackController,
      required ValueChanged<double> onRatingChanged,
      double currentRating = 1}) {
    final _formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Rate Your Experience!',
                  style: style20B.copyWith(color: darkGreyColor),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            20.verticalSpace,
            Center(
              child: RatingStars(
                value: currentRating,
                onValueChanged: onRatingChanged,
                starCount: 5,
                starSize: 40.0,
                starColor: primaryColor,
                valueLabelVisibility: false,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: feedbackController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your feedback';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Share Your Feedback on Our Store and Products',
                hintStyle: style12.copyWith(color: lightGreyColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              maxLines: 3,
            ),
            20.verticalSpace,
            CustomButton(
                text: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                  return null;
                }),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
