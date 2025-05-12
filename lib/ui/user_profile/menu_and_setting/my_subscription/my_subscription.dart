import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_subscription/my_subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MySubscriptionViewModel(),
      child: Consumer<MySubscriptionViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: CustomAppBar(isBackButton: true, title: 'My subscription'
                //  title: "My Orders",
                ),
          ),
        ),
      ),
    );
  }
}
