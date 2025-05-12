import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_subscription/my_subscription_view_model.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_subscription/subscription_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class MySUbscriptionScreen extends StatefulWidget {
  const MySUbscriptionScreen({super.key});

  @override
  State<MySUbscriptionScreen> createState() => _MySUbscriptionScreenState();
}

class _MySUbscriptionScreenState extends State<MySUbscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MySubscriptionViewModel(),
      child: Consumer<MySubscriptionViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: CustomAppBar(isBackButton: true, title: 'My Subscription'),
          ),
          body: Column(
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    2,
                    (index) {
                      final tabTitles = [
                        'Active',
                        'Completed',
                      ];
                      return _tabs(
                          text: tabTitles[index],
                          isSelected: model.selectedTabIndex == index,
                          onTap: () {
                            model.setSelectedTab(index);
                          });
                    },
                  ),
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: model.selectedTabIndex == 0
                    ? ListView.builder(
                        itemCount: model.activeBooking.length,
                        itemBuilder: (context, index) {
                          final order = model.activeBooking[index];
                          return CustomSubscriptionCard(
                            subscriptionItem: order,
                            showDetailsButton: false,
                            onTrackTap: () => model.trackOrder(order),
                            onDetailsTap: () {
                              model.showOrderDetails(order);
                            },
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: model.completedBooking.length,
                        itemBuilder: (context, index) {
                          final order = model.completedBooking[index];
                          return CustomSubscriptionCard(
                            subscriptionItem: order,
                            showDetailsButton: true,
                            onDetailsTap: () {
                              model.showOrderDetails(order);
                            },
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  _tabs(
      {required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        width: 110.w,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: isSelected ? secondaryColor : blackColor,
          ),
        ),
        child: Text(
          text,
          style: style14.copyWith(color: isSelected ? whiteColor : blackColor),
        ),
      ),
    );
  }
}

///
///
///
///
///     model
///
class MySubscriptionModel {
  final String imageUrl;
  final String title;

  final String trackingStatus;

  MySubscriptionModel({
    required this.imageUrl,
    required this.title,
    required this.trackingStatus,
  });
}

///
///      custom
///
class CustomSubscriptionCard extends StatelessWidget {
  final MySubscriptionModel subscriptionItem;
  final VoidCallback? onTrackTap;
  final VoidCallback? onDetailsTap;
  final bool showDetailsButton;

  const CustomSubscriptionCard({
    super.key,
    required this.subscriptionItem,
    this.onTrackTap,
    this.onDetailsTap,
    this.showDetailsButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              image: DecorationImage(
                image: AssetImage(subscriptionItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subscriptionItem.title,
                  style: style16.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    5.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monthly Membership',
                          style: style12.copyWith(color: lightGreyColor),
                        ),
                      ],
                    ),
                    Spacer(),
                    // fot track button
                    if (!showDetailsButton && onTrackTap != null)
                      GestureDetector(
                        onTap: () {
                          Get.to(SubscriptionDetailScreen());
                        },
                        child: Container(
                          height: 40.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: darkGreyColor, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              subscriptionItem.trackingStatus,
                              style: style16.copyWith(color: darkGreyColor),
                            ),
                          ),
                        ),
                      ),
                    // for detail button
                    if (showDetailsButton && onDetailsTap != null)
                      SizedBox(width: 12.w),
                    if (showDetailsButton && onDetailsTap != null)
                      GestureDetector(
                        onTap: () {
                          Get.to(SubscriptionDetailScreen());
                        },
                        child: Container(
                          height: 40.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: darkGreyColor, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'Details',
                              style: style16.copyWith(color: darkGreyColor),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
