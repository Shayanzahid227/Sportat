// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:code_structure/ui/store_categories_screen/store_categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreCategoriesScreenViewModel(),
      child: Consumer<StoreCategoriesScreenViewModel>(
        builder: (context, model, child) => DefaultTabController(
          length: 6,
          child: Scaffold(
            ///
            /// Start Body
            ///
            body: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
