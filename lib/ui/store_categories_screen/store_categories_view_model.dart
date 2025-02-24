import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/model/store_categories_screen.dart';
import 'package:code_structure/core/others/base_view_model.dart';

class StoreCategoriesScreenViewModel extends BaseViewModel {
  final List<StoreCategoryModel> categoriesList = [
    StoreCategoryModel(
      id: '1',
      title: 'Sportswear',
      imageUrl: AppAssets().storeCategories1,
      subCategories: [
        StoreSubCategoryModel(id: "1", title: "Activewear"),
        StoreSubCategoryModel(id: "2", title: "Athletic Tops"),
        StoreSubCategoryModel(id: "3", title: "Leggings "),
        StoreSubCategoryModel(id: "4", title: "Shorts"),
      ],
    ),
    StoreCategoryModel(
      id: '2',
      title: 'footwear ',
      imageUrl: AppAssets().storeCategories2,
      subCategories: [
        StoreSubCategoryModel(id: "1", title: "Nike"),
        StoreSubCategoryModel(id: "2", title: "Gucci"),
        StoreSubCategoryModel(id: "3", title: "Adidas"),
      ],
    ),
    StoreCategoryModel(
      id: '3',
      title: 'fitness',
      imageUrl: AppAssets().storeCategories3,
      subCategories: [
        StoreSubCategoryModel(id: "1", title: "weight plates"),
        StoreSubCategoryModel(id: "2", title: "Dumbbells"),
        StoreSubCategoryModel(id: "3", title: "Yoga Mates "),
        StoreSubCategoryModel(id: "4", title: "Jump Ropes"),
      ],
    ),
    StoreCategoryModel(
        id: '4',
        title: 'Equipments',
        imageUrl: AppAssets().storeCategories4,
        subCategories: [StoreSubCategoryModel(id: '1', title: 'training Cons')])
  ];
}
