// ignore_for_file: camel_case_types, use_key_in_widget_constructors, deprecated_member_use

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/custom_sub_categories_details.dart';
import 'package:code_structure/ui/store_categories_screen/store_categories_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreCategoriesViewModel(),
      child: Consumer<StoreCategoriesViewModel>(
        builder: (context, model, child) => DefaultTabController(
          length: model.categoriesList.length,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(title: "Store Categories"),
            ),
            body: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  labelColor: secondryColor,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 4.h,
                  dividerHeight: 0.0,
                  tabAlignment: TabAlignment.start,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: secondryColor,
                  onTap: (index) => model.selectCategory(index),
                  tabs: model.categoriesList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value;
                    final isSelected = model.selectedCategoryIndex == index;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "${category.imageUrl}",
                          height: 40.h,
                          width: 40.w,
                        ),
                        10.verticalSpace,
                        Text(
                          "${category.title}",
                          style: style16B.copyWith(
                            color: isSelected ? secondryColor : Colors.black,
                          ),
                        ),
                        5.verticalSpace,
                      ],
                    );
                  }).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: model.categoriesList.map((category) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            16.verticalSpace,
                            SizedBox(
                              height: 50.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: category.subCategories!.length,
                                itemBuilder: (context, index) {
                                  final subCategory =
                                      category.subCategories![index];
                                  final isSelected =
                                      model.selectedSubCategoryIndex == index;
                                  return GestureDetector(
                                    onTap: () => model.selectSubCategory(index),
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 16),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? secondryColor.withOpacity(0.20)
                                            : whitecolor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "${subCategory.title}",
                                        style: style16B.copyWith(
                                          color: isSelected
                                              ? secondryColor
                                              : blackColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            20.verticalSpace,
                            model.selectedSubCategoryDetails.isNotEmpty
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        model.selectedSubCategoryDetails.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.85,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomStoreSubCategoriesDetails(
                                        storeSubCategoryDetail: model
                                            .selectedSubCategoryDetails[index],
                                        addCartOnTap: () {},
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      "No Data",
                                      style: style20B,
                                    ),
                                  ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
