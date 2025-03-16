class StoreCategoryModel {
  String? id;
  String? title;
  String? imageUrl;
  // we can call our sub categories list by this name
  List<StoreSubCategoryModel>? subCategories;

  StoreCategoryModel({
    this.id,
    this.title,
    this.imageUrl,
    this.subCategories,
  });
}

class StoreSubCategoryModel {
  String? id;
  String? title;
  List<StoreSubCategoryDetail>? subCategoryDetails;

  StoreSubCategoryModel({this.id, this.title, this.subCategoryDetails});
}

class StoreSubCategoryDetail {
  String? id;
  String? title;
  String? imageUrl;
  String? price;

  StoreSubCategoryDetail({this.id, this.title, this.imageUrl, this.price});
}
