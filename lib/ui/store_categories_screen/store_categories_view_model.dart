import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/model/store_categories_screen.dart';
import 'package:code_structure/core/others/base_view_model.dart';

class StoreCategoriesViewModel extends BaseViewModel {
  int selectedCategoryIndex = 0;
  int selectedSubCategoryIndex = 0;
  List<StoreSubCategoryDetail> selectedSubCategoryDetails = [];

  StoreCategoriesViewModel() {
    // Initialize with the first category's data by default
    selectCategory(0);
  }

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    selectedSubCategoryIndex = 0;

    if (categoriesList[index].subCategories != null &&
        categoriesList[index].subCategories!.isNotEmpty) {
      selectedSubCategoryDetails =
          categoriesList[index].subCategories![0].subCategoryDetails ?? [];
    } else {
      selectedSubCategoryDetails = [];
    }

    notifyListeners();
  }

  void selectSubCategory(int index) {
    selectedSubCategoryIndex = index;
    selectedSubCategoryDetails = categoriesList[selectedCategoryIndex]
            .subCategories![index]
            .subCategoryDetails ??
        [];

    notifyListeners();
  }

  final List<StoreCategoryModel> categoriesList = [
    StoreCategoryModel(
      id: '1',
      title: 'Sportswear',
      imageUrl: AppAssets().storeCategories4,
      subCategories: [
        StoreSubCategoryModel(
            id: "1",
            title: "Activewear",
            subCategoryDetails: [
              StoreSubCategoryDetail(
                  id: '1',
                  title: 'Union BOA Clipless Shoes',
                  price: '41 SAR',
                  imageUrl: AppAssets().screenStoreCategories6),
              StoreSubCategoryDetail(
                  id: '2',
                  title: 'chemical compounds',
                  price: '30 SAR',
                  imageUrl: AppAssets().shirts),
              StoreSubCategoryDetail(
                  id: '3',
                  title: 'Union BOA Clipless Shoes',
                  price: '421 SAR',
                  imageUrl: AppAssets().screenStoreCategories5),
              StoreSubCategoryDetail(
                  id: '4',
                  title: 'Union BOA Clipless Shoes',
                  price: '31 SAR',
                  imageUrl: AppAssets().screenStoreCategories4),
            ]),
        StoreSubCategoryModel(
            id: "2",
            title: "Athletic Tops",
            subCategoryDetails: [
              StoreSubCategoryDetail(
                  id: '1',
                  title: 'Union BOA Clipless Shoes',
                  price: '41 SAR',
                  imageUrl: AppAssets().screenStoreCategories6),
              StoreSubCategoryDetail(
                  id: '3',
                  title: 'chemical compounds',
                  price: '30 SAR',
                  imageUrl: AppAssets().shirts),
              StoreSubCategoryDetail(
                  id: '3',
                  title: 'Union BOA Clipless Shoes',
                  price: '421 SAR',
                  imageUrl: AppAssets().screenStoreCategories5),
              StoreSubCategoryDetail(
                  id: '4',
                  title: 'Union BOA Clipless Shoes',
                  price: '31 SAR',
                  imageUrl: AppAssets().screenStoreCategories4),
            ]),
        StoreSubCategoryModel(id: "3", title: "Leggings ", subCategoryDetails: [
          StoreSubCategoryDetail(
              id: '1',
              title: 'Union BOA Clipless Shoes',
              price: '41 SAR',
              imageUrl: AppAssets().screenStoreCategories6),
          StoreSubCategoryDetail(
              id: '2',
              title: 'chemical compounds',
              price: '30 SAR',
              imageUrl: AppAssets().shirts),
          StoreSubCategoryDetail(
              id: '3',
              title: 'Union BOA Clipless Shoes',
              price: '421 SAR',
              imageUrl: AppAssets().screenStoreCategories5),
          StoreSubCategoryDetail(
              id: '4',
              title: 'Union BOA Clipless Shoes',
              price: '31 SAR',
              imageUrl: AppAssets().screenStoreCategories4),
        ]),
        StoreSubCategoryModel(id: "4", title: "Shorts", subCategoryDetails: [
          StoreSubCategoryDetail(
              id: '1',
              title: 'Shorts Shoes',
              price: '41 SAR',
              imageUrl: AppAssets().arrival),
          StoreSubCategoryDetail(
              id: '2',
              title: 'Shorts compounds',
              price: '30 SAR',
              imageUrl: AppAssets().arrival),
          StoreSubCategoryDetail(
              id: '3',
              title: 'Shorts Shoes',
              price: '421 SAR',
              imageUrl: AppAssets().arrival),
          StoreSubCategoryDetail(
              id: '4',
              title: 'Shorts pad',
              price: '31 SAR',
              imageUrl: AppAssets().arrival),
        ]),
      ],
    ),
    StoreCategoryModel(
      id: '2',
      title: 'Footwear',
      imageUrl: AppAssets().storeCategories2,
      subCategories: [
        StoreSubCategoryModel(id: "1", title: "Nike"),
        StoreSubCategoryModel(id: "2", title: "Gucci", subCategoryDetails: [
          StoreSubCategoryDetail(
              id: '1',
              title: 'Union BOA Clipless Shoes',
              price: '41 SAR',
              imageUrl: AppAssets().screenStoreCategories6),
          StoreSubCategoryDetail(
              id: '2',
              title: 'chemical compounds',
              price: '30 SAR',
              imageUrl: AppAssets().shirts),
          StoreSubCategoryDetail(
              id: '3',
              title: 'Union BOA Clipless Shoes',
              price: '421 SAR',
              imageUrl: AppAssets().screenStoreCategories5),
          StoreSubCategoryDetail(
              id: '4',
              title: 'Union BOA Clipless Shoes',
              price: '31 SAR',
              imageUrl: AppAssets().screenStoreCategories4),
        ]),
        StoreSubCategoryModel(id: "3", title: "Adidas"),
      ],
    ),
    StoreCategoryModel(
      id: '3',
      title: 'Fitness',
      imageUrl: AppAssets().storeCategories1,
      subCategories: [
        StoreSubCategoryModel(
            id: "1",
            title: "Weight Plates",
            subCategoryDetails: [
              StoreSubCategoryDetail(
                  id: '1',
                  title: 'Union BOA Clipless Shoes',
                  price: '41 SAR',
                  imageUrl: AppAssets().sportCategories1),
              StoreSubCategoryDetail(
                  id: '2',
                  title: 'chemical compounds',
                  price: '30 SAR',
                  imageUrl: AppAssets().sportCategories2),
              StoreSubCategoryDetail(
                  id: '3',
                  title: 'Union BOA Clipless Shoes',
                  price: '421 SAR',
                  imageUrl: AppAssets().sportCategories3),
              StoreSubCategoryDetail(
                  id: '4',
                  title: 'Union BOA Clipless Shoes',
                  price: '31 SAR',
                  imageUrl: AppAssets().sportCategories4),
            ]),
        StoreSubCategoryModel(id: "2", title: "Dumbbells"),
        StoreSubCategoryModel(id: "3", title: "Yoga Mats"),
        StoreSubCategoryModel(
            id: "4",
            title: "Jump Ropes",
            subCategoryDetails: [
              StoreSubCategoryDetail(
                  id: '1',
                  title: 'Union BOA Clipless Shoes',
                  price: '41 SAR',
                  imageUrl: AppAssets().sportCategories6),
              StoreSubCategoryDetail(
                  id: '2',
                  title: 'chemical compounds',
                  price: '30 SAR',
                  imageUrl: AppAssets().arrival),
              StoreSubCategoryDetail(
                  id: '3',
                  title: 'Union BOA Clipless Shoes',
                  price: '421 SAR',
                  imageUrl: AppAssets().sportCategories3),
              StoreSubCategoryDetail(
                  id: '4',
                  title: 'Union BOA Clipless Shoes',
                  price: '31 SAR',
                  imageUrl: AppAssets().arrivals1),
            ]),
      ],
    ),
    StoreCategoryModel(
      id: '4',
      title: 'Equipments',
      imageUrl: AppAssets().storeCategories3,
      subCategories: [
        StoreSubCategoryModel(
            id: '1',
            title: 'Training Cones',
            subCategoryDetails: [
              StoreSubCategoryDetail(
                  id: '1',
                  title: 'Union BOA Clipless Shoes',
                  price: '41 SAR',
                  imageUrl: AppAssets().arrival),
              StoreSubCategoryDetail(
                  id: '2',
                  title: 'chemical compounds',
                  price: '30 SAR',
                  imageUrl: AppAssets().arrival),
              StoreSubCategoryDetail(
                  id: '3',
                  title: 'Union BOA Clipless Shoes',
                  price: '421 SAR',
                  imageUrl: AppAssets().arrival),
              StoreSubCategoryDetail(
                  id: '4',
                  title: 'Union BOA Clipless Shoes',
                  price: '31 SAR',
                  imageUrl: AppAssets().arrival),
            ]),
      ],
    ),
  ];
}
