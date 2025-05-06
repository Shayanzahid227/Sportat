// ignore_for_file: unused_element, use_key_in_widget_constructors, deprecated_member_use

import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/sportat/top_subscription_screen.dart';
import 'package:code_structure/ui/top_subscription_screen/top_subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TopSubScriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopSubscriptionViewModel(),
      child: Consumer<TopSubscriptionViewModel>(
        builder: (context, model, child) => Scaffold(

            ///
            /// Start App Bar
            ///
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: CustomAppBar(title: "Top Subscriptions")),

            ///
            /// Start Body
            ///
            body: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: model.topSubscriptionsList.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomTopSubscriptions(
                  topSubscriptions: model.topSubscriptionsList[index],
                  ClubOnTap: () {},
                );
              },
            )),
      ),
    );
  }
}
