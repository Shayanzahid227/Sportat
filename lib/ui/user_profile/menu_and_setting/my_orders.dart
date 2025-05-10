import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(
          isBackButton: true,
          title: "My Orders",
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
