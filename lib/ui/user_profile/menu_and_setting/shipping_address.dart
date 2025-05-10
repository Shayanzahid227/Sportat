import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(
          isBackButton: true,
          title: "Shipping Address",
        ),
      ),
    );
  }
}
