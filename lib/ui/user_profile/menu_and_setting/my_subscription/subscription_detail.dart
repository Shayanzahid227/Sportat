import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SubscriptionDetailScreen extends StatelessWidget {
  const SubscriptionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(isBackButton: true, title: 'Subscription details'
            //  title: "My Orders",
            ),
      ),
    );
  }
}
