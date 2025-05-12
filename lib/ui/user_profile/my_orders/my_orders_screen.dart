import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/user_profile/my_orders/detail_order.dart';
import 'package:code_structure/ui/user_profile/my_orders/my_orders_view_model.dart';
import 'package:code_structure/ui/user_profile/my_orders/track_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    String _appBartitle = 'My Orders';
    return ChangeNotifierProvider(
      create: (context) => MyOrdersViewModel(),
      child: Consumer<MyOrdersViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: CustomAppBar(isBackButton: true, title: 'My Orders'
                //  title: "My Orders",
                ),
          ),
          body: Column(
            children: [
              30.verticalSpace,
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
                        itemCount: model.activeOrders.length,
                        itemBuilder: (context, index) {
                          final order = model.activeOrders[index];
                          return OrderItemCard(
                            orderItem: order,
                            onTrackTap: () => model.trackOrder(order),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: model.completedOrders.length,
                        itemBuilder: (context, index) {
                          final order = model.completedOrders[index];
                          return OrderItemCard(
                            orderItem: order,
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
  ///      tabs
  ///
  _tabs(
      {required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115.w,
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
///     model
///
class OrderItem {
  final String imageUrl;
  final String title;
  final List<String> additionalItems;
  final String trackingStatus;

  OrderItem({
    required this.imageUrl,
    required this.title,
    required this.additionalItems,
    required this.trackingStatus,
  });
}

///
///      custom
///
class OrderItemCard extends StatelessWidget {
  final OrderItem orderItem;
  final VoidCallback? onTrackTap;
  final VoidCallback? onDetailsTap;
  final bool showDetailsButton;

  const OrderItemCard({
    super.key,
    required this.orderItem,
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
                image: AssetImage(orderItem.imageUrl),
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
                  orderItem.title,
                  style: style16.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 30.h,
                          width: 35.w,
                          color: Colors.grey[400],
                        ),
                        Positioned(
                          left: 15.w,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              border: Border.all(color: whiteColor, width: 1.w),
                            ),
                            height: 30.h,
                            width: 35.w,
                          ),
                        ),
                      ],
                    ),
                    5.horizontalSpace,
                    Text(
                      '+ ${orderItem.additionalItems.length} Items',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                    Spacer(),
                    // fot track button
                    if (!showDetailsButton && onTrackTap != null)
                      GestureDetector(
                        onTap: () {
                          Get.to(TrackOrderScreen());
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
                              orderItem.trackingStatus,
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
                          Get.to(OrderDetailScreen());
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
