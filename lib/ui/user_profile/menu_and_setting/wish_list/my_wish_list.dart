import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/custom_new_arrivals.dart';
import 'package:code_structure/ui/store/cart/cart_screen.dart';
import 'package:code_structure/ui/store/product_detail_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/wish_list/my_wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class MyWishListScreen extends StatelessWidget {
  const MyWishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyWishListViewModel(),
      child: Consumer<MyWishListViewModel>(
          builder: (context, model, child) => Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(56.0),
                  child: CustomAppBar(
                    isBackButton: true,
                    title: "WishList",
                  ),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    30.verticalSpace,
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          3,
                          (index) {
                            final tabTitles = [
                              'Booking',
                              'Subscribes',
                              'Products'
                            ];
                            return _tabs(
                              text: tabTitles[index],
                              isSelected: model.selectedTabIndex == index,
                              onTap: () => model.setSelectedTab(index),
                            );
                          },
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    model.selectedTabIndex == 0
                        ? Text('bookings')
                        : model.selectedTabIndex == 1
                            ? Text('Subscribes')
                            : model.selectedTabIndex == 2
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: GridView.builder(
                                          itemCount:
                                              model.newArrivalsList.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 0.9,
                                                  mainAxisSpacing: 16),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.to(ProductDetailScreen());
                                              },
                                              child: CustomNewArrivals(
                                                newArrivalsModel: model
                                                    .newArrivalsList[index],
                                                addCartOnTap: () {
                                                  Get.to(CartScreen());
                                                },
                                              ),
                                            );
                                          }),
                                    ),
                                  )
                                : Text('no data found')
                  ],
                ),
              )),
    );
  }

  ///
  ///      booking     subscribes   and   products     container
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
