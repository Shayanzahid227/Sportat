import 'package:code_structure/ui/home/store_categories_screen/store_categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesSCreen_02 extends StatefulWidget {
  const CategoriesSCreen_02({super.key});

  @override
  State<CategoriesSCreen_02> createState() => _CategoriesSCreen_02State();
}

class _CategoriesSCreen_02State extends State<CategoriesSCreen_02> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreCategoriesScreenViewModel(),
      child: Consumer<StoreCategoriesScreenViewModel>(
        builder: (context, model, child) => DefaultTabController(
          length: 6,
          child: Scaffold(
            body: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: '${model.categoriesList[0].imageUrl}'),
                    Tab(text: 'Electronics'),
                    Tab(text: 'Electronics'),
                    Tab(text: 'Electronics'),
                    Tab(text: 'Electronics'),
                    Tab(text: 'Electronics'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
