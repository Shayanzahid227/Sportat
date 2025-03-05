// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/ui/subscription/subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscribtionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscribtionViewModel(),
      child: Consumer<SubscribtionViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backGroundColor,
          body: Center(
            child: Text("Subscribtion Screen"),
          ),
        ),
      ),
    );
  }
}
