import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/custom_new_arrivals.dart';
import 'package:code_structure/ui/store/cart/cart_screen.dart';
import 'package:code_structure/ui/store/product_detail_screen.dart';
import 'package:code_structure/ui/store/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class TopSellingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreViewModel(),
      child: Consumer<StoreViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
            ),
            title: Text(
              "Top Selling Screen",
              style: style20B,
            ),
          ),

          ///
          /// Start Body
          ///
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
                itemCount: model.newArrivalsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailScreen());
                    },
                    child: CustomNewArrivals(
                      newArrivalsModel: model.newArrivalsList[index],
                      addCartOnTap: () {
                        Get.to(CartScreen());
                      },
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
