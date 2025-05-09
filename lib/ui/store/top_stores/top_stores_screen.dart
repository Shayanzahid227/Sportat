import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/ui/store/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TopStoresScreen extends StatelessWidget {
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
              "Top Stores Screen",
              style: style20B,
            ),
          ),

          ///
          /// Start Body
          ///
        ),
      ),
    );
  }
}
